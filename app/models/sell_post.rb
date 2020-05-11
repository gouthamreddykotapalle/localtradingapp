class SellPost < Post
  has_one_attached :upload_image
  self.table_name = "sell_posts"
  has_many :details, class_name: "SellPostDetail", foreign_key: "post_id", dependent: :destroy

  def self.search_by(search_term)
    # code here
    search_term = search_term.downcase
    logger.info("search term is - ")
    logger.info(search_term)
    result = where("LOWER(title) LIKE ? or LOWER(category) LIKE ?", "%" + search_term + "%", "%" + search_term + "%")
    logger.info("result=")
    logger.info(result)
    return result
  end
end
