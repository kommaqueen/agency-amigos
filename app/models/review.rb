class Review < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity

  validates :content, presence: true, length: { minimum: 6 }
  validates :rating, presence: true
end
