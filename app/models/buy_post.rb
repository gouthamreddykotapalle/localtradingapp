class BuyPost < Post
  has_one_attached :upload_image
  self.table_name = "buy_posts"
  has_many :details, class_name: "BuyPostDetail", foreign_key: "post_id", dependent: :destroy

  before_validation(on: [:create, :save]) do
    if price_range_are_numbers? && self.price_low > self.price_high
      self.price_low, self.price_high = self.price_high, self.price_low
    end
  end

  def price_range_are_numbers?
    attribute_present?("price_low") && attribute_present?("price_high") &&
        self.price_low.is_a?(Numeric) && self.price_high.is_a?(Numeric)
  end

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
