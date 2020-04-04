class Template < ApplicationRecord
  has_many :sell_post_details, foreign_key: "field_id", dependent: :destroy
  has_many :buy_post_details, foreign_key: "field_id", dependent: :destroy

  # define constant
  BUY = "buy"
  SELL = "sell"

  validates :post_type, inclusion: { in: %w(buy sell), message: "%{value} should be either buy or sell" }
  validates :category, format: { with: /\A[a-z0-9\s]+\z/,
                                  message: "only allow lowercase letters, numbers, and space" }
  validates :column_id, format: { with: /\A[a-z0-9_]+\z/,
                                    message: "only allow lowercase letters, numbers, and underscore" }
  validates :column_name, format: { with: /\A[a-zA-Z0-9\s]+\z/,
                                  message: "only allow letters and numbers" }
  validates :datatype, inclusion: { in: %w(string int decimal), message: "%{value} is invalid datatype" }
end
