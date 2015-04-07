class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.integer :price, null: false
      t.integer :capacity, null: false
      t.string :address, null: false
      t.text :description, null: false
      t.integer :cover_photo_id

      t.timestamps null: false
    end

    add_index :listings, :owner_id
    add_index :sessions, :user_id
  end
end
