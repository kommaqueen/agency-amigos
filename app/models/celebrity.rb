class Celebrity < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy

  # must add add celebrity user story validations
  validates :name, uniqueness: true, presence: true
  validates :category, presence: true, inclusion: { in: %w(sports film influencer politics music),
    message: "%{value} is not a valid category" }
  validates :description, presence: true, length: { in: 6..400 }
  validates :daily_rate, presence: true, numericality: { only_integer: true, greater_than: 1 }

  # pg search
  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
  against: [ :name, :category ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  # avg rating for their star display
  def avg_rating
    # map puts all ratings into an array
    avg = reviews.map(&:rating).sum.fdiv(reviews.length)
    (avg * 2).round / 2.0 unless avg.nan?
  end

<<<<<<< HEAD
  # booking conflict
  # def booking_conflict?(start_date, end_date)
  #   conflicts = bookings.any? do |booking|
  #     (start_date - booking.ends_on) * (booking.starts_on - end_date) >= 0
  #   end

  #   !conflicts
  # end
=======
>>>>>>> b3777ad52964e0e27158d71c26c900fd497ad333
end
