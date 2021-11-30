class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[filter search show]

  def show
    @listing = Listing.find(params[:id])
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
    @listing = Listing.where(state: params[:id])
  end
end
