class BuyPostDetailSchema < ApplicationRecord
  has_many :detail_schema, class_name: "BuyPostDetail", foreign_key: "field_id", dependent: :destroy
end
