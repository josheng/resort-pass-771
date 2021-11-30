class ReservationsController < ApplicationController
  def new
  end

  def show
    @reservations = Reservation.where(listing_id: params[:id])
  end
end
