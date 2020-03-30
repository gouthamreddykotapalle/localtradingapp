class BuyPostDetailSchema < ApplicationRecord
  has_many :details, class_name: "BuyPostDetail", foreign_key: "field_id", dependent: :destroy
end
