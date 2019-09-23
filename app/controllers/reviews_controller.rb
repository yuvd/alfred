class ReviewsController < ApplicationController

  def index
    @place = Place.find(params[:place_id])
  end

  def new
    @review = Review.new
    @place = Place.find(params[:place_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @place = Place.find(params[:place_id])
    @review.place = @place
    # raise
    if @review.save
      redirect_to place_reviews_path(@place)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
