class UsersController < ApplicationController
  skip_before_action :set_current_user, only: [:login, :new, :create]

  def login
    if session.include? :user_id
      set_current_user
      redirect_to user_path(@current_user.id)
      return
    end
    render 'users/login'
  end

  def index
    # users list are not supposed to explore by ordinary users
    # It should always redirect back to home page until we develop Admin role
    redirect_to user_path(@current_user)
  end

  def new
    # GET only
    @title = 'Register | ' + APP_NAME
  end

  def create
    # POST only. (registration)
    user = User.create(registration_params)
    if user.save
      session[:user_id] = user.email
      set_current_user
      redirect_to user_path(@current_user.id)
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    id = params[:id] # retrieve post ID from URI route
    @user = User.find(id) # look up post by unique ID
    if @user.nil?
      redirect_back static_page_home_path
      return
    end
    @columns = [
        {name: "Title", id: "title"},
        {name: "Type", id: "type"},
        {name: "Category", id: "category"},
        {name: "Update Time", id: "update_time"},
        {name: "Create Time", id: "create_time"}
    ]

    @posts = []
    filter_with_post_types @posts
    sort_posts @posts
  end

  private

  def registration_params
    params.require(:users).permit(:first_name, :last_name, :email, :password)
  end

  def filter_with_post_types(posts)
    set_checked_post_types default: %w(buy sell)

    if session[:post_types].include? "buy"
      BuyPost.where(user_id: @user.email).each do |post|
        posts.append({title: post.title, type: "buy", category: post.category, post_id: post.id,
                      update_time: post.updated_at.strftime("%B %d, %Y"),
                      create_time: post.created_at.strftime("%B %d, %Y")}
        )
      end
    end

    if session[:post_types].include? "sell"
      SellPost.where(user_id: @user.email).each do |post|
        posts.append({title: post.title, type: "sell", category: post.category, post_id: post.id,
                      update_time: post.updated_at.strftime("%B %d, %Y"),
                      create_time: post.created_at.strftime("%B %d, %Y")}
        )
      end
    end
  end

  def set_checked_post_types(default: nil)
    post_types = params.fetch(:post_types, nil)
    if post_types != nil
      session[:post_types] = post_types.keys
    else
      session[:post_types] = default
    end
  end

  def sort_posts(posts)
    sorted_key = params.fetch(:sorted, nil)
    if sorted_key != nil
      session[:user_profile_sorted_key] = sorted_key
    end

    column_ids = @columns.map { |column| column[:id].to_s }
    if column_ids.include? session[:user_profile_sorted_key]
      posts.sort_by! do |post|
         post[session[:user_profile_sorted_key].to_sym]
      end
    end
  end

end