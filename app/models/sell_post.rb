class SellPost < Post
  self.table_name = "sell_posts"

  def self.all_categories
    self.pluck(:category).uniq
  end

  def self.with_categories(categories)
    self.where :category => categories
  end

end
