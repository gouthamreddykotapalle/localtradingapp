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
    redirect_to '/'
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