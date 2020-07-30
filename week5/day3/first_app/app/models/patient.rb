class Patient < ApplicationRecord
  has_many :appointements
  has_many :physicians, through: :appointements
end
