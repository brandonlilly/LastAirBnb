class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
    add_index :amenities, :name, unique: true
  end
end
