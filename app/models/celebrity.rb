class Celebrity < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :name, uniqueness: true, presence: true
  # must add add celebrity user story validations
end
