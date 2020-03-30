class SellPostDetailSchema < ApplicationRecord
  has_many :details, class_name: "SellPostDetail", foreign_key: "field_id", dependent: :destroy
end
