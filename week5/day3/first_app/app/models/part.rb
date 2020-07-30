class Part < ApplicationRecord
  has_many_belongs_to_many :assemblies
end
