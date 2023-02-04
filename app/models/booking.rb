class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity

  validates :starts_on, :ends_on, presence: true

  # must add validation for start and ends dates
  # make sure chosen dates are not taken by other booking

  # maybe validates uniqueness of, scope: thing
end
