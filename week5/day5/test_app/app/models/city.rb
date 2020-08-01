class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true, uniqueness: true, format: { with: /\A\d+\z/, message: "please enter a valid french zip code" }
  has_many :listings
end
