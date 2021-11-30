class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render listing_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :reservation_id, :booking_date)
  end
end
