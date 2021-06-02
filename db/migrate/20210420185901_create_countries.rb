class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :country_id, null: false
      t.string :name, null: false

    end
    add_index :countries, :country_id, unique: true
  end
end
