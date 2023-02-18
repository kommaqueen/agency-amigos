class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity

  # must add validation for start and ends dates
  validates :starts_on, :ends_on, presence: true
  validates :starts_on, uniqueness: {scope: :celebrity_id}

  # make sure chosen dates are not taken by other booking
end
