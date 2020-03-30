class CreateSellPostDetailSchemas < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_post_detail_schemas do |t|
      t.string :category
      t.string :column_id
      t.string :column_name
      t.string :datatype

      t.timestamps
    end

    SellPostDetailSchema.create! category: "art", column_id: "author", column_name: "Author", datatype: "string"
    SellPostDetailSchema.create! category: "art", column_id: "year", column_name: "Year", datatype: "int"
    SellPostDetailSchema.create! category: "art", column_id: "genre", column_name: "Genre", datatype: "string"
  end
end
