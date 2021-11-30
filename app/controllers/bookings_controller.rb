class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.reservation = Reservation.find(params[:booking][:reservation_id])
    @booking.total_price = (@booking.no_of_adult * @booking.reservation.adult_price) + (@booking.no_of_child * @booking.reservation.child_price)
    # @booking.listing = @booking.reservation.listing
    if @booking.save
      redirect_to root_path
    else
      render listing_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :reservation_id, :booking_date, :no_of_adult, :no_of_child, :total_price)
  end
end
