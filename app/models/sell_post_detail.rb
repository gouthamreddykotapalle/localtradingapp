class SellPostDetail < ApplicationRecord
  belongs_to :post, class_name: "SellPost", foreign_key: "post_id"
  belongs_to :field, class_name: "Template", foreign_key: "field_id"
end
