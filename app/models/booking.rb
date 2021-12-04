class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :reservation
  validates :no_of_adult, presence: true, numericality: true
  validates :no_of_child, presence: true, numericality: true
  validates :booking_date, presence: true

  def full_address
    "#{reservation.listing.address}, #{reservation.listing.city}, #{reservation.listing.state}, #{reservation.listing.country}"
  end
end
