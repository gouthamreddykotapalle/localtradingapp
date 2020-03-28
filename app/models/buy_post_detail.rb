class BuyPostDetail < ApplicationRecord
  belongs_to :buy_post , foreign_key: "post_id"
  belongs_to :buy_post_detail_schema, foreign_key: "field_id"
end
