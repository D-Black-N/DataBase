class City < ApplicationRecord
    belongs_to :country, class_name: "Country", foreign_key: "country_id"
    has_many :arenas, class_name: "Arena"
end
