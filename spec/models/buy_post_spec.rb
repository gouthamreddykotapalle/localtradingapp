require 'rails_helper'

RSpec.describe BuyPost, type: :model do
  it { should validate_presence_of(:user_id) }
end
