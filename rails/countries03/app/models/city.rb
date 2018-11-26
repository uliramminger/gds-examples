class City < ApplicationRecord
  belongs_to :country
  has_many :museums, dependent: :destroy
end
