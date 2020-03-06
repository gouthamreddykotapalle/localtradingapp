class SessionsController < ApplicationController

  def create
    user = User.find_by(email:login_params[:email])

    if user and user.authenticate( login_params[:email], login_params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard' #add this
    else
      flash[:login_errors] = ['invalid credentials']
      redirect_to '/login'
    end
  end

  private
  def login_params
    params.require(:users).permit(:email, :password)
  end

end