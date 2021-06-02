class Championship < ApplicationRecord
    belongs_to :country, class_name: "Country", foreign_key: "country_id"
    has_many :teams, class_name: "Team"
    has_many :games, class_name: "Game"
end
