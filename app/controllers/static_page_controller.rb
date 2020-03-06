class StaticPageController < ApplicationController
  # skip_before_action :set_current_user, only: [:home]

  def index
    # GET only
    render 'index'
  end

  def home
    # GET only
    @title = 'Home | ' + APP_NAME
  end

  def about
    # GET only
    @title = 'About | ' + APP_NAME
  end

  def contact
    # GET only
    @title = 'Contact | ' + APP_NAME
  end

  def privacypolicy
    # GET only
    @title = 'Privacy Policy | ' + APP_NAME
  end

  def terms
    # GET only
    @title = 'Terms & Conditions | ' + APP_NAME
  end

end
