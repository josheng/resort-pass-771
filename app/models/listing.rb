class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews
  serialize :hours, Array
  serialize :facilities, Array
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :by_most_reviews, -> do
    select("listings.*, COUNT(reviews.title) AS review_count")
    .joins(:reviews)
    .group("listings.id")
    .order("review_count DESC")
    .limit(8)
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
                  against: [ :name, :address, :city, :state, :country ],
                  using: {
                    tsearch: { prefix: true }
                  }

  def full_address
    "#{address}, #{city}, #{state}, #{country}"
  end
end
