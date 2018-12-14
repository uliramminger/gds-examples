class Book < ApplicationRecord
  has_many :publications
  has_many :authors, through: :publications
end
