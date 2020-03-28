class CreateBuyPostDetailSchemas < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_post_detail_schemas do |t|
      t.string :category
      t.string :column
      t.string :datatype

      t.timestamps
    end

    BuyPostDetailSchema.create! category: "car", column: "make", datatype: "string"
    BuyPostDetailSchema.create! category: "car", column: "year", datatype: "int"
    BuyPostDetailSchema.create! category: "car", column: "mileage", datatype: "int"
  end
end
