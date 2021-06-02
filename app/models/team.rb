class Team < ApplicationRecord
    belongs_to :arena, class_name: "Arena", foreign_key: "stadium_id"
    has_many :players, class_name: "Player"
    has_many :championships, class_name: "Championship"
    has_many :statistics, class_name: "Statistic"
    has_many :games, class_name: "Game"
end
