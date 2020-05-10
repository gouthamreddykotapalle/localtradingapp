class ApplicationController < ActionController::Base
  include ApplicationHelper

  APP_NAME = 'The Local Trading App'

  before_action :set_current_user, :geolocate

  protected # prevents method from being invoked by a route

  def set_current_user
    # we exploit the fact that find_by_id(nil) returns nil
    @current_user ||= User.find_by_email(session[:user_id])
    redirect_to login_path unless @current_user
  end

  def geolocate
    @user_coordinates = Geocoder.search(request.remote_ip.to_s).first.coordinates

    if @user_coordinates.empty?  # localhost
      @user_coordinates = [40.7209, -74.0007]  # Wall St
    end

    Rails.logger.debug "[DEBUG] User Coords: #{@user_coordinates}"
  end
end
