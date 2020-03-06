class UsersController < ApplicationController
  skip_before_action :set_current_user, only: [:login, :new, :create]

  def login
    email = session.fetch(:user_id, nil)
    if email != nil
      @user = User.find_by_email email
    end
    render "users/login"
  end

  def index
    redirect_to login
  end

  def new
    @title = 'Register | ' + APP_NAME
    @new_user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
    # @new_user = User.find_(params[:id])
    # @new_user = User.find_by(email:params[:email])
  end

  private

  def user_params
    params.require(:email)
    params.permit(:first_name, :last_name, :email, :password)
  end

end