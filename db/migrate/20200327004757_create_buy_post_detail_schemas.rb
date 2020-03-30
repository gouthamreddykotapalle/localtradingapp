class CreateBuyPostDetailSchemas < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_post_detail_schemas do |t|
      t.string :category
      t.string :column_id
      t.string :column_name
      t.string :datatype

      t.timestamps
    end

    BuyPostDetailSchema.create! category: "car", column_id: "make", column_name: "Make", datatype: "string"
    BuyPostDetailSchema.create! category: "car", column_id: "year", column_name: "Year", datatype: "int"
    BuyPostDetailSchema.create! category: "car", column_id: "mileage", column_name: "Mileage", datatype: "int"
  end
end
