class BuyPostDetail < ApplicationRecord
  belongs_to :post, class_name: "BuyPost", foreign_key: "post_id"
  belongs_to :field, class_name: "BuyPostDetailSchema", foreign_key: "field_id"
end
