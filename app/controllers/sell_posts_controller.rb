class SellPostsController < ApplicationController
  include PostHelper

  def index
    # GET only. /sell_posts
    before_index
    sort_index
    index_with_categories
  end

  def new; end

  def create
    # POST only. /sell_posts
    sell_post = SellPost.create!(sell_post_params use_current_user: true)
    insert_details(sell_post)

    if sell_post.is_a? SellPost
      flash[:notice] = "#{sell_post.title} was successfully created."
    end
    redirect_to sell_posts_path
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @sell_post = SellPost.find(id) # look up post by unique ID
    prepare_details
  end

  def edit
    @sell_post = SellPost.find params[:id]
    prepare_details
    authorize_to_edit? @sell_post, redirect_path: sell_posts_path
  end

  def update
    @sell_post = SellPost.find params[:id]
    @sell_post.update_attributes!(sell_post_params)
    @sell_post.details.destroy_all
    insert_details(@sell_post)
    flash[:notice] = "#{@sell_post.title} was successfully updated."
    redirect_to sell_post_path(@sell_post)
  end

  def destroy
    @sell_post = SellPost.find(params[:id])
    @sell_post.destroy
    flash[:notice] = "Post '#{@sell_post.title}' deleted."
    redirect_to sell_posts_path
  end

  def detail_form
    if params[:id].nil?
      category = params['category']
      prepare_details category
    else
      @sell_post = SellPost.find(params[:id])
      @sell_post.category = params['category']
      prepare_details
    end
    render json: {html: render_to_string(partial: 'templates/detail')}
  end

  private

  def before_index
    # Column Information for GET /sell_posts
    @columns = [
        {name: :title, id: :title, sort_allowed: true},
        {name: :email, id: :user_id, sort_allowed: true},
        {name: :category, id: :category, sort_allowed: true},
        {name: :price, id: :price, sort_allowed: true},
        {name: :bargain?, id: :bargain_allowed, sort_allowed: false},
        {name: :upload_image, id: :upload_image_id, sort_allowed: false},
    ]

    # clear session if indicated
    if !!params.fetch(:reset, nil)
      reset_session
    end

    @sell_posts = SellPost.all
  end

  private

  def insert_details(sell_post)
    if params.has_key? :detail
      templates = Template.where post_type: Template::SELL, category: sell_post.category
      details = params[:detail]
      templates.each do |template|
        detail = {
            post: sell_post,
            field: template,
            value: details[template.column_id]
        }
        SellPostDetail.create! detail
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
      @sell_posts = @sell_posts.order session[:sorted_key]
    end
  end

  def index_with_categories
    @all_categories = sort_categories SellPost.all_categories
    set_checked_categories default: @all_categories

    if session[:categories] != nil
      @sell_posts = @sell_posts.with_categories session[:categories]
    end
  end

  def sell_post_params(use_current_user: false)
    post_param = params.require(:sell_post).permit(:title, :user_id, :category, :content, :price, :bargain_allowed, :upload_image)
    if use_current_user && !post_param.include?(:user_id)
      post_param[:user_id] = @current_user.email
    end
    post_param
  end

  def prepare_details(category = nil)
    unless @sell_post.is_a? SellPost
      @details = {}
      if category.nil?
        @templates = []
      else
        @templates = Template.where post_type: Template::SELL, category: category
      end
      return
    end
    @templates = Template.where post_type: Template::SELL, category: @sell_post.category
    @details = {}
    @sell_post.details.all.each do |entity|
      @details[entity.field.column_id] = entity.value
    end
  end
end