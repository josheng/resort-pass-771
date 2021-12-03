class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index filter search show]

  def index
    @listings = Listing.all
    @pagy, @records = pagy(@listings, items: 50)
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = @listing.reservations.find_by(type: 'DayPass')
    @booking = Booking.new
    @pagy, @records = pagy(@listing.reviews)
    # @markers = {lat: 1.3019, lng: 103.83 }
    if @listing.geocode.present?
      @markers = { lat: @listing.geocode[0],
                  lng: @listing.geocode[1],
                  info_window: render_to_string(partial: "shared/info_window", locals: { listing: @listing }) }
    end

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "shared/reviews", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end
  end

  def search
    @listings = Listing.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @listings = Listing.search_by_name_and_location(@name)
      @pagy, @records = pagy(@listings)
    end
  end

  def filter
    filter = params["format"]
    @listings = Listing.where(state: filter)
    @pagy, @records = pagy(@listings)
  end
end
