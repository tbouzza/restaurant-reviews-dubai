class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # 1. find the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

    # 2. instantiate a review filled with the form data
    @review = Review.new(review_params)

    # 3. connect the review with the restaurant
    @review.restaurant = @restaurant

    if @review.save
      redirect_to @restaurant
    else
      render :new
    end

  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    redirect_to @review.restaurant
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to @review.restaurant
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end
end
