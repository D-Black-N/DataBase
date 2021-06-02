class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.integer :city_id, null: false
      t.string :name, null: false
      t.string :country_id, null: false

    end
    add_index :cities, :city_id, unique: true
  end
end
