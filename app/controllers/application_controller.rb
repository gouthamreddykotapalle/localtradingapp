class ApplicationController < ActionController::Base
  include ApplicationHelper

  APP_NAME = 'The Local Trading App'
  before_action :set_current_user

  protected # prevents method from being invoked by a route

  def set_current_user
    # we exploit the fact that find_by_id(nil) returns nil
    @current_user ||= User.find_by_email(session[:user_id])
    # redirect_to login_path unless @current_user # => unable to view static pages with this uncommented
  end
end
