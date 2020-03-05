class SellPostsController < ApplicationController
  include Response
  include ExceptionHandler

  # GET /sell_posts
  def index
    @sell_posts = SellPost.all
    json_response(@sell_posts)
  end
end
