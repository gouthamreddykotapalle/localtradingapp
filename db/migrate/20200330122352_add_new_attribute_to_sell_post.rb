class AddNewAttributeToSellPost < ActiveRecord::Migration[5.2]
  def change
    add_column :sell_posts, :upload, :string
  end
end
