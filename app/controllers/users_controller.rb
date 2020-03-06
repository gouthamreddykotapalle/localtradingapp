class UsersController < ApplicationController
  skip_before_action :set_current_user, only: [:login, :post_login, :new, :create]

  def login
    email = session.fetch(:user_id, nil)
    if email != nil
      @user = User.find_by_email email
    end
    render "users/login"
  end

  def post_login
    login_info = get_post_object :login_info
    email = login_info.require(:email)
    password = login_info.require :password
    user = User.find_by_email_and_password email, password
    if user == nil
      flash[:notice] = "Email and/or password are incorrect"
      redirect_to login
    end
    session[:user_id] = user.email
    redirect_back fallback_location: '/'
  end

  def index
    #need to add this for now
    @title = 'Login or USERNAME | ' + APP_NAME
  end

  def new
    @title = 'Register | ' + APP_NAME
    @new_user = User.new
  end

  def create
    @new_user = User.create(post_params)
    if @new_user.save
      redirect_to @new_user
    else
      render 'new'
    end
  end

  def show
    @new_user = User.find(params[:id])
  end

  private
  def post_params
    params.require(:email)
    params.permit(:first_name, :last_name, :email, :password)
  end

end
