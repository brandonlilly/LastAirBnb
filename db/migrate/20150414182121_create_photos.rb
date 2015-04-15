class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.integer :listing_id, null: false
      t.integer :ord, default: 0
      t.boolean :verified, default: false

      t.timestamps null: false
    end
    
    add_index :photos, :listing_id
  end
end
