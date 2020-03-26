class PostCategoryToDowncase < ActiveRecord::Migration[5.2]
  def change
    BuyPost.all.each do |post|
      post.update_attribute :category, post.category.downcase
    end

    SellPost.all.each do |post|
      post.update_attribute :category, post.category.downcase if post.category.is_a?(String)
    end
  end
end
