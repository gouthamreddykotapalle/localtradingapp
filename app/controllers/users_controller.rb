class UsersController < ApplicationController
  skip_before_action :set_current_user, only: [:login, :new, :create]

  def login
    email = session.fetch(:user_id, nil)
    if email != nil
      @user = User.find_by_email email
    end
    render 'users/login'
  end

  def index
    # GET only
    # @user = User.find_by_email(session.fetch(:user_id, nil)) # find the user from session obj
    @current_user ? render('users/show') : redirect_to(login_path)
  end

  def new
    # GET only
    @title = 'Register | ' + APP_NAME
  end

  def create
    # POST only (registration)
    user = User.create(registration_params)
    if user.save
      session[:user_id] = user.email
      redirect_to users_path
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to login_path
    end
  end

  def show
  end

  private

  def registration_params
    params.require(:users).permit(:first_name, :last_name, :email, :password)
  end

end