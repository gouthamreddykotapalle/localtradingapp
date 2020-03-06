class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, limit: 40
      t.string :password, limit: 512
      t.string :first_name
      t.string :last_name
      t.datetime :last_updated
      t.integer :active_posts

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
