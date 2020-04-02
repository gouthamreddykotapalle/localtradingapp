class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :trade
      t.string :category
      t.string :column_id
      t.string :column_name
      t.string :datatype

      t.timestamps
    end

    Template.create! trade: "buy", category: "car", column_id: "make", column_name: "Make", datatype: "string"
    Template.create! trade: "buy", category: "car", column_id: "year", column_name: "Year", datatype: "int"
    Template.create! trade: "buy", category: "car", column_id: "mileage", column_name: "Mileage", datatype: "int"

    Template.create! trade: "sell", category: "art", column_id: "author", column_name: "Author", datatype: "string"
    Template.create! trade: "sell", category: "art", column_id: "year", column_name: "Year", datatype: "int"
    Template.create! trade: "sell", category: "art", column_id: "genre", column_name: "Genre", datatype: "string"
  end
end
