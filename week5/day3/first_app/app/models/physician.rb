class Physician < ApplicationRecord
  has_many :appointements
  has_many :patients, through: :appointements
end

