class Transaction < ApplicationRecord
  belongs_to :payer, class_name: "User", foreign_key: "payer_id"
  belongs_to :payee, class_name: "User", foreign_key: "payee_id"
  belongs_to :buy_post, optional: true
  belongs_to :sell_post, optional: true

  number_only_regex = /\A[0-9]+\z/
  expiration_date_regex = /\A[0-9]{2}\/[0-9]{2}\z/

  validates :card_number, length: {maximum: 19}, format: { with: number_only_regex,
                                    message: "only allows numbers" }
  validates :expiration_date, format: { with: expiration_date_regex, message: "only mm/yy" }

  validates :cvv, length: {maximum: 4}, format: { with: number_only_regex, message: "max 4 digits" }

  validates :zip_code, length: {maximum: 6}, format: { with: number_only_regex, message: "max 6 digits" }

end
