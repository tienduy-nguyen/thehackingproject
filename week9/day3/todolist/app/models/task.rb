class Task < ApplicationRecord
  validates :title, presence: true
  belongs_to :category

  def is_done?
    return self.status
  end

end
