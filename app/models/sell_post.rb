class SellPost < Post
  has_one_attached :upload_image
  self.table_name = "sell_posts"
end
