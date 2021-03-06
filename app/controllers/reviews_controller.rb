class ReviewsController < ApplicationController
 before_action :find_restaurant_id

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      puts "Review is nto saved #{@review.errors.full_messages}"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
