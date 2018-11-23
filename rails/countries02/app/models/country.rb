class Country < ApplicationRecord
  has_many :bigCities, class_name: 'City', dependent: :destroy
end
