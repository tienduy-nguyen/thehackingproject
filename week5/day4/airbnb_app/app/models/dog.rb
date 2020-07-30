class Dog < ApplicationRecord
  has_many :trolls
  has_many :dogs, through: :trolls
  belongs_to :city
end
