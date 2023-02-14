class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_celebrity, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.celebrity = @celebrity
    if @review.save
      redirect_to celebrity_reviews_path
    else
      render "celebrities/show", status: :unprocessable_entity
      flash[:alert] = "Something went wrong."
    end
  end



  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to celebrity_path, status: :see_other
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:celebrity_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :celebrity_id)
  end

end
