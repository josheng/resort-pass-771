class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.reservation = Reservation.find(params[:booking][:reservation_id])
    if @booking.no_of_adult.present? || @booking.no_of_child.present?
      @booking.total_price = (@booking.no_of_adult * @booking.reservation.adult_price) + (@booking.no_of_child * @booking.reservation.child_price)
      @booking.save
      redirect_to @booking
    else
      # render listing_path(@booking.reservation.listing)
      render "shared/result"
    end
    # @booking.listing = @booking.reservation.listing
    # if @booking.save
    #   redirect_to @booking
    # else
    #   render listing_path(@booking.reservation.listing)
    # end
  end

  def show
    @bookings = current_user.bookings.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :reservation_id, :booking_date, :no_of_adult, :no_of_child, :total_price)
  end
end
