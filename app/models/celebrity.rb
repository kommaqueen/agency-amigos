class Celebrity < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, uniqueness: true, presence: true

  # add photo { has_many_attached ? :photo} w cloudinary
  has_many_attached :photos

  # must add add celebrity user story validations
end
