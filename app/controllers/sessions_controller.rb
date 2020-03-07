class SessionsController < ApplicationController
  skip_before_action :set_current_user, only: [:create]

  def create
    # POST only. Creates a session using email, password
    login_info = params.require :login_info
    email = login_info.require(:email)
    password = login_info.require :password

    begin
      user = User.authenticate email, password
      session[:user_id] = user.email
      set_current_user
      redirect_to user_path(@current_user.id)
    rescue => error
      flash[:notice] = error.message.to_s
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
