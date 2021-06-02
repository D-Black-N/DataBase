class Arena < ApplicationRecord
    belongs_to :city, class_name: "City", foreign_key: "city_id"
    has_many :teams, class_name: "Team"
    has_many :games, class_name: "Game"
end
