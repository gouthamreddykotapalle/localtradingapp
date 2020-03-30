class SellPost < Post
  self.table_name = "sell_posts"
  has_many :details, class_name: "SellPostDetail", foreign_key: "post_id", dependent: :destroy
end
