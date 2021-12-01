class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index filter search show]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation= @listing.reservations.find_by(type: 'DayPass')
    @booking = Booking.new
    @markers = {lat: 1.3019, lng: 103.83 }
  end

  def search
    @listings = Listing.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @listings = Listing.where("name ILIKE ?", "%#{@name}%")
    end
  end

  def filter
    filter = params["format"]
    @listings = Listing.where(state: filter)
  end
end
