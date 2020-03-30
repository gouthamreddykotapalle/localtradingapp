class CreateSellPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_posts do |t|
      t.string :title
      t.string :user_id
      t.string :category
      t.text :content

      t.decimal :price
      t.boolean :bargain_allowed

      t.timestamps

    end
  end
end
