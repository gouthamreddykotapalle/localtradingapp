class BuyPostsController < ApplicationController
  include PostHelper

  def index
    logger.info("inside buy posts controller")
    before_index
    sort_index
    index_with_categories
  end

  def new
    logger.info("calling new in buy")
  end

  def map_all
    # @buy_posts = BuyPost.all

    logger.info("params=")
    logger.info(params)
    if params[:search]
      logger.info("search")
      logger.info(params)
      @search_term = params[:search]
      logger.info("search term first is ")
      logger.info(@search_term)
      @buy_posts = BuyPost.search_by(@search_term)
    else
      logger.info("no search")
      @buy_posts = BuyPost.all
    end

    @response = []
    @buy_posts.each do |post|

      if post.upload_image.attached?
        upload_image_url = url_for(post.upload_image)
      else
        upload_image_url = "https://theacres.com/wp-content/uploads/2015/07/placeholder-image-icon-7.png"
      end

      if post.price_high.blank?
        logger.info("Price high not present")
        post.price_high = 0
      end

      if post.price_low.blank?
        logger.info("Price low not present")
        post.price_low = 0
      end

      if post.latitude.present?
        logger.info("lat"+post.latitude.to_s)
        logger.info("long"+post.longitude.to_s)
      end

      # TODO: More error handling

      @response << {
          id: post.id,
          title: post.title,
          user: post.user_id,
          price_low: post.price_low.round,
          price_high: post.price_high.round,
          description: post.content,
          latitude: post.latitude,
          longitude: post.longitude,
          upload_image: upload_image_url,
          view_link: url_for(post)
      }
    end

    sleep 1

    render json: @response
  end

  def create
    # POST only. /buy_posts
    buy_post = BuyPost.create!(buy_post_params use_current_user: true)
    insert_details(buy_post)

    if buy_post.is_a? BuyPost
      flash[:notice] = "#{buy_post.title} was successfully created."
    end
    redirect_to buy_posts_path
  end

  def show
    id = params[:id] # retrieve post ID from URI route
    @buy_post = BuyPost.find(id) # look up post by unique ID
    prepare_details
  end

  def edit
    @buy_post = BuyPost.find params[:id]
    prepare_details
    authorize_to_edit? @buy_post, redirect_path: buy_posts_path
  end

  def update
    @buy_post = BuyPost.find params[:id]
    @buy_post.update_attributes!(buy_post_params)
    @buy_post.details.destroy_all
    insert_details(@buy_post)
    flash[:notice] = "#{@buy_post.title} was successfully updated."
    redirect_to buy_post_path(@buy_post)
  end

  def destroy
    @buy_post = BuyPost.find(params[:id])
    @buy_post.destroy
    flash[:notice] = "Post '#{@buy_post.title}' deleted."
    redirect_to buy_posts_path
  end

  def detail_form
    if params[:id].nil?
      category = params['category']
      prepare_details category
    else
      @buy_post = BuyPost.find(params[:id])
      @buy_post.category = params['category']
      prepare_details
    end
    render json: {html: render_to_string(partial: 'templates/detail')}
  end

  private

  def before_index
    # Column Information for GET /buy_posts
    @columns = [
        {name: "title", id: :title, sort_allowed: true},
        {name: "email", id: :user_id, sort_allowed: true},
        {name: "category", id: :category, sort_allowed: true},
        {name: "price_range (low)", id: :price_low, sort_allowed: true},
        {name: "price_range (high)", id: :price_high, sort_allowed: true},
        {name: :upload_image, id: :upload_image_id, sort_allowed: false},
    ]
    # @buy_posts = BuyPost.all
    if params[:search]
      logger.info("search")
      logger.info(params)
      @search_term = params[:search]
      logger.info("search term first is ")
      logger.info(@search_term)
      @buy_posts = BuyPost.search_by(@search_term)
    else
      logger.info("no search")
      @buy_posts = BuyPost.all
    end
    logger.info("inside buy posts before index")
  end

  private

  def insert_details(buy_post)
    if params.has_key? :detail
      templates = Template.where post_type: Template::BUY, category: buy_post.category
      details = params[:detail]
      templates.each do |template|
        detail = {
            post: buy_post,
            field: template,
            value: details[template.column_id]
        }
        BuyPostDetail.create! detail
      end
    end
  end

  def sort_index
    sorted_key = params.fetch(:sorted, nil)
    if sorted_key != nil
      session[:sorted_key] = sorted_key
    end

    column_ids = @columns.map { |column| column[:id].to_s}
    if column_ids.include? session[:sorted_key]
      @buy_posts = @buy_posts.order session[:sorted_key]
    end

    logger.info("inside buy posts sort index")
  end

  def index_with_categories
    @all_categories = sort_categories BuyPost.all_categories
    set_checked_categories default: @all_categories

    if session[:categories] != nil
      @buy_posts = @buy_posts.with_categories session[:categories]
    end
    logger.info("inside buy posts index with categories")
  end

  def buy_post_params(use_current_user: false)
    post_param = params.require(:buy_post).permit(:title, :user_id, :category, :content,
                                                  :price_low, :price_high, :bargain_allowed, :upload_image, :latitude, :longitude)
    if use_current_user && !post_param.include?(:user_id)
      post_param[:user_id] = @current_user.email
    end
    post_param
  end

  def prepare_details(category = nil)
    unless @buy_post.is_a? BuyPost
      @details = {}
      if category.nil?
        @templates = []
      else
        @templates = Template.where post_type: Template::BUY, category: category
      end
      return
    end
    @templates = Template.where post_type: Template::BUY, category: @buy_post.category
    @details = {}
    @buy_post.details.all.each do |entity|
      @details[entity.field.column_id] = entity.value
    end
  end
end
