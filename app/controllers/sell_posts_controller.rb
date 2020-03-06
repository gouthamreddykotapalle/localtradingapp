class SellPostsController < ApplicationController
  include Response
  include ExceptionHandler

  # GET /sell_posts
  def index
    before_index
    @sell_posts = SellPost.all
    sort_index
    index_with_categories
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
    @all_categories = SellPost.all_categories
    categories = params.fetch(:categories, nil)

    if categories != nil
      session[:categories] = categories.keys
    else
      session[:categories] = @all_categories
    end

    if session[:categories] != nil
      @sell_posts = @sell_posts.with_categories session[:categories]
    end
  end
end