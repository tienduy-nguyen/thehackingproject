class Listing < ApplicationRecord
  validates :available_beds, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length:{minimum: 140}
  validates :welcome_message, presence: true

  belongs_to :city
  belongs_to :administrator, class_name: "User" 
  has_many :reservations

end
