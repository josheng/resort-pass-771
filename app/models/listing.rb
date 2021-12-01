class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews

  scope :by_most_reviews, -> do
    select("listings.*, COUNT(reviews.title) AS review_count")
      .joins(:reviews)
      .group("listings.id")
      .order("review_count DESC")
      .limit(8)
  end
end
