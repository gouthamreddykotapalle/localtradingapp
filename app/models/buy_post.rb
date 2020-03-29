class BuyPost < Post
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
end
