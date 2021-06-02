class Country < ApplicationRecord
    has_many :cities, class_name: "City"
    has_many :championships, class_name: "Championship"
    has_many :players, class_name: "Player"
end
