class Country < ApplicationRecord
  has_many :bigCities, class_name: 'City', dependent: :destroy
  has_many :famousPeople, class_name: 'Person', dependent: :destroy
end
