class Reservation < ApplicationRecord
  belongs_to :listing
  serialize :details, Array
end
