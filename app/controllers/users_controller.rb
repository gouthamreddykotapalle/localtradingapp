class UsersController < ApplicationController
  def index
    #need to add this for now
  end

  def new
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
    params.require(:post).permit(:first_name, :last_name, :email, :password)
  end

end
