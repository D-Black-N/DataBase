class CreateArenas < ActiveRecord::Migration[6.1]
  def change
    create_table :arenas do |t|
      t.string :stadium_id, null: false
      t.string :name, null: false
      t.integer :capacity, default: 5000
      t.integer :city_id, null: false

    end
    add_index :arenas, :stadium_id, unique: true
  end
end
