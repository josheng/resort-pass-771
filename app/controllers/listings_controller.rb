class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
  end

  def filter
    @listing = Listing.where(state: params[:id])
  end
end
