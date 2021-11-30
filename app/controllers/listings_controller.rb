class ListingsController < ApplicationController
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
end
