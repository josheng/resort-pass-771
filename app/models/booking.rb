class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  def full_address
    "#{reservation.listing.address}, #{reservation.listing.city}, #{reservation.listing.state}, #{reservation.listing.country}"
  end
end
