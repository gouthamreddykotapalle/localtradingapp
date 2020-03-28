class CreateBuyPostDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_post_details do |t|
      t.references :post, foreign_key: true
      t.references :field, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
