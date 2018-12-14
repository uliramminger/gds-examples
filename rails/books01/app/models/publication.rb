class Publication < ApplicationRecord
  belongs_to :book
  belongs_to :author
end
