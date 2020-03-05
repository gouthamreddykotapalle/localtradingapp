class CreateBuyPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_posts do |t|
      t.string :title
      t.string :user_id
      t.string :category
      t.text :content

      t.decimal :price_low
      t.decimal :price_high

      t.timestamps
    end
  end
end
