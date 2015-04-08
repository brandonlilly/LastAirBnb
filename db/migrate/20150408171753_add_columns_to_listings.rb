class AddColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :home_type_id, :integer, null: false
    add_index :listings, :home_type_id

    add_column :listings, :bedrooms, :integer, null: false
    add_column :listings, :beds, :integer, null: false
    add_column :listings, :bathrooms, :integer, null: false
  end
end
