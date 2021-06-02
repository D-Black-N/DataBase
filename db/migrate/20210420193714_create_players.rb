class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :num_contract, null: false
      t.string :short_name, null: false
      t.string :name, null: false
      t.integer :t_num, null: false
      t.string :country_id, null: false
      t.string :team_id

    end
    add_index :players, :num_contract, unique: true
  end
end
