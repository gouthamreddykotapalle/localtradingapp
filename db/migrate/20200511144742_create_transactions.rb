class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :payer, foreign_key: {to_table: :users}
      t.references :payee, foreign_key: {to_table: :users}
      t.references :buy_post, foreign_key: true
      t.references :sell_post, foreign_key: true
      t.string :post_type
      t.decimal :amount
      t.string :payment_type
      t.string :card_number
      t.string :card_holder
      t.string :expiration_date
      t.string :cvv
      t.string :zip_code

      t.timestamps
    end
  end
end
