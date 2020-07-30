class Assembly < ApplicationRecord
  has_many_belongs_to_many :parts
end
