class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @listing = Listing.new
  end

  def create
    @review = Review.new(review_params)
    @listing = Listing.find(params[:listing_id])
    @review.user = current_user
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      render listing_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :listing_id)
  end
end
