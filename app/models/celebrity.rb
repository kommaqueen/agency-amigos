class Celebrity < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  # must add add celebrity user story validations

  # avg rating for their star display
  def avg_rating
    # map puts all ratings into an array
    avg = reviews.map(&:rating).sum.fdiv(reviews.length)
    (avg * 2).round / 2.0 unless avg.nan?
  end
end
