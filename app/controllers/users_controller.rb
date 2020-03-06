class UsersController < ApplicationController


  def index
    #renders user/index view automatically?
    render 'index'
  end

  def new
    render 'new'
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
    params.require(:users).permit(:first_name, :last_name, :email, :password)
  end

end