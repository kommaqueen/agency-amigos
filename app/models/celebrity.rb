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

  def self.get_celeb_message(celebrity)
    case celebrity.category
    when "film"
      "Predatory Film Star"
    when "music"
      "Whiny Musician"
    when "sports"
      "Overpaid Athlete"
    when "influencer"
      "Privileged 'Influencer'"
    when "politics"
      "Corrupt Politican"
    end
  end

end
