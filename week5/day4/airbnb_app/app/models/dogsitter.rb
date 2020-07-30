class Dogsitter < ApplicationRecord
  has_many :trolls
  has_many :dogsitter, through: :trolls
  belongs_to :city
end
