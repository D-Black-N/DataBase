class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.integer :stat_id
      t.integer :posession
      t.integer :fouls
      t.integer :goals
      t.integer :shots
      t.string :game_id
      t.string :team_id

    end
    add_index :statistics, :stat_id, unique: true
  end
end
