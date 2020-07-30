class Troll < ApplicationRecord
  belongs_to :dogsitter
  belongs_to :dog
  belongs_to :city
end
