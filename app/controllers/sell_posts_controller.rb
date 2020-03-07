class SellPostsController < ApplicationController
  include PostHelper

  # GET /sell_posts
  def index
    before_index
    sort_index
    index_with_categories
  end

  # Post /sell_posts
  def create
    sell_post = SellPost.create!(sell_post_params use_current_user: true)
    if sell_post.is_a? SellPost
      flash[:notice] = "#{sell_post.title} was successfully created."
    end
    redirect_to sell_posts_path
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @sell_post = SellPost.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def edit
    @sell_post = SellPost.find params[:id]
  end

  def update
    @sell_post = SellPost.find params[:id]
    @sell_post.update_attributes!(sell_post_params)
    flash[:notice] = "#{@sell_post.title} was successfully updated."
    redirect_to sell_post_path(@sell_post)
  end

  def destroy
    @sell_post = SellPost.find(params[:id])
    @sell_post.destroy
    flash[:notice] = "Movie '#{@sell_post.title}' deleted."
    redirect_to sell_posts_path
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
    ]

    # clear session if indicated
    if !!params.fetch(:reset, nil)
      reset_session
    end

    @sell_posts = SellPost.all
  end

  private

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
    post_param = params.require(:sell_post).permit(:title, :user_id, :category, :content, :price, :bargain_allowed)
    if use_current_user && !post_param.include?(:user_id)
      post_param[:user_id] = @current_user.email
    end
    post_param
  end
end