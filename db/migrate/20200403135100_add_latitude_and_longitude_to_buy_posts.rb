class AddLatitudeAndLongitudeToBuyPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_posts, :latitude, :decimal
    add_column :buy_posts, :longitude, :decimal
  end
end
