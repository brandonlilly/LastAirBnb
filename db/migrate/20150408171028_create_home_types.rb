class CreateHomeTypes < ActiveRecord::Migration
  def change
    create_table :home_types do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    add_index :home_types, :name, unique: true
  end
end
