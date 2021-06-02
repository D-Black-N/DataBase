class Statistic < ApplicationRecord
    belongs_to :game, class_name: "Game", foreign_key: "game_id"
    belongs_to :team, class_name: "Team", foreign_key: "team_id"
end
