class AddLatitudeAndLongitudeToSellPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :sell_posts, :latitude, :decimal
    add_column :sell_posts, :longitude, :decimal
  end
end
