class CreateSellPostDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_post_details do |t|
      t.references :post, foreign_key: {to_table: :sell_posts}
      t.references :field, foreign_key: {to_table: :templates}
      t.string :value

      t.timestamps
    end
  end
end
