class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :listing_id, null: false
      t.integer :user_id, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.timestamps null: false
    end

    add_index :reviews, [ :listing_id, :user_id ], unique: true
  end
end
