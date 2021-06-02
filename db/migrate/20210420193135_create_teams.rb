class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :team_id, null: false
      t.string :name, null: false
      t.string :cham_id, null: false
      t.string :stadium_id, null: false

    end
    add_index :teams, :team_id, unique: true
  end
end
