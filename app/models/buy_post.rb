class BuyPost < Post
  has_one_attached :upload_image
  self.table_name = "buy_posts"

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
