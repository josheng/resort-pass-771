class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @listing = Listing.find(params[:review][:listing_id])
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      render listing_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :listing_id, :title)
  end
end
