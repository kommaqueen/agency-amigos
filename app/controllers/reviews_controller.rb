class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_celebrity, only: [:index, :new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.celebrity = @celebrity
    if @review.save
      redirect_to celebrity_reviews_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:celebrity_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :celebrity_id)
  end

end
