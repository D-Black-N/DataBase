class Game < ApplicationRecord
    belongs_to :arena, class_name: "Arena", foreign_key: "arena_id"
    belongs_to :championship, class_name: "Championship", foreign_key: "cham_id"
    belongs_to :team, class_name: "Team", foreign_key: "team_h"
    belongs_to :team, class_name: "Team", foreign_key: "team_a"
    has_many :statistics, class_name: "Statistic"
end
