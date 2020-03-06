class SessionsController < ApplicationController
  skip_before_action :set_current_user, only: [:create]

  def create
    login_info = get_post_object :login_info
    email = login_info.require(:email)
    password = login_info.require :password
    user = User.authenticate email, password
    session[:user_id] = user.email
    redirect_back fallback_location: '/'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end