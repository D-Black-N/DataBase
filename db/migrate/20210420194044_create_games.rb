class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :game_id, null: false
      t.string :team_h, null: false
      t.string :team_a, null: false
      t.string :cham_id, null: false
      t.string :stadium_id, null: false
      t.datetime :game_date, null: false

    end
  end
end
