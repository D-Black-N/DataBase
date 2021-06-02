class CreateChampionships < ActiveRecord::Migration[6.1]
  def change
    create_table :championships do |t|
      t.string :cham_id, null: false
      t.string :champ, null: false
      t.string :country_id, null: false
      
    end
    add_index :championships, :cham_id, unique: true
  end
end
