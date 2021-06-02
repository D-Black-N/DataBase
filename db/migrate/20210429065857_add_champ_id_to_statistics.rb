class AddChampIdToStatistics < ActiveRecord::Migration[6.1]
  def change
    add_column :statistics, :champ_id, :string
  end
end
