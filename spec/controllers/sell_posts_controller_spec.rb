require 'rails_helper'

RSpec.describe SellPostsController, type: :controller do
# initialize test data
  let!(:sell_posts) { create_list(:sell_post, 2) }

  # Test suite for GET /sell_posts
  describe 'GET /sell_posts' do
    # make HTTP get request before each example
    before { get 'index' }

    it 'returns sell posts' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
