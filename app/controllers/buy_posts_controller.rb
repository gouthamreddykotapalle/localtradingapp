class BuyPostsController < ApplicationController
  include PostHelper

  def index
    before_index
    sort_index
    index_with_categories
  end

  def new; end

  def create
    # POST only. /buy_posts
    buy_post = BuyPost.create!(buy_post_params use_current_user: true)
    if buy_post.is_a? BuyPost
      flash[:notice] = "#{buy_post.title} was successfully created."
    end
    redirect_to buy_posts_path
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @buy_post = BuyPost.find(id) # look up movie by unique ID
  end

  def edit
    @buy_post = BuyPost.find params[:id]
  end

  def update
    @buy_post = BuyPost.find params[:id]
    @buy_post.update_attributes!(buy_post_params)
    flash[:notice] = "#{@buy_post.title} was successfully updated."
    redirect_to buy_post_path(@buy_post)
  end

  def destroy
    @buy_post = BuyPost.find(params[:id])
    @buy_post.destroy
    flash[:notice] = "Post '#{@buy_post.title}' deleted."
    redirect_to buy_posts_path
  end

  private

  def before_index
    # Column Information for GET /buy_posts
    @columns = [
        {name: "title", id: :title, sort_allowed: true},
        {name: "email", id: :user_id, sort_allowed: true},
        {name: "category", id: :category, sort_allowed: true},
        {name: "price_range (low)", id: :price_low, sort_allowed: true},
        {name: "price_range (high)", id: :price_high, sort_allowed: true}
    ]

    # clear session if indicated
    if !!params.fetch(:reset, nil)
      reset_session
    end

    @buy_posts = BuyPost.all
  end

  private

  def sort_index
    sorted_key = params.fetch(:sorted, nil)
    if sorted_key != nil
      session[:sorted_key] = sorted_key
    end

    column_ids = @columns.map { |column| column[:id].to_s}
    if column_ids.include? session[:sorted_key]
      @buy_posts = @buy_posts.order session[:sorted_key]
    end
  end

  def index_with_categories
    @all_categories = sort_categories BuyPost.all_categories
    set_checked_categories default: @all_categories

    if session[:categories] != nil
      @buy_posts = @buy_posts.with_categories session[:categories]
    end
  end

  def buy_post_params(use_current_user: false)
    post_param = params.require(:buy_post).permit(:title, :user_id, :category, :content,
                                                  :price_low, :price_high, :bargain_allowed)
    if use_current_user && !post_param.include?(:user_id)
      post_param[:user_id] = @current_user.email
    end
    post_param
  end
end
