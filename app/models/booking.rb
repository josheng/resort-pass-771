class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :day_pass
end
