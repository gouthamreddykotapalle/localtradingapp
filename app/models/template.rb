class Template < ApplicationRecord
  has_many :sell_post_details, foreign_key: "field_id", dependent: :destroy
  has_many :buy_post_details, foreign_key: "field_id", dependent: :destroy

  # define constant
  BUY = "buy"
  SELL = "sell"
end
