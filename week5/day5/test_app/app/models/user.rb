class User < ApplicationRecord
  validates  :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :phone, presence: true, format: { with: /\A\d+\z/, message: "please enter a valid french number" }
  has_many :reservations, class_name: 'User', foreign_key: "guest_id"
  has_many :listings, class_name: 'User', foreign_key: 'administrator_id'

end
