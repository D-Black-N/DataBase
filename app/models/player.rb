class Player < ApplicationRecord
    belongs_to :team, class_name: "team", foreign_key: "team_id"
    belongs_to :country, class_name: "Country", foreign_key: "country_id"
end
