class CelebritiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_celebrity, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @celebrities = Celebrity.search_by_name_and_category(params[:query])
    else
      @celebrities = Celebrity.all
    end
  end

  def show
    @review = Review.new
    @booking_user = find_booking_user(@celebrity)
    @message = Celebrity.get_celeb_message(@celebrity)
    # ask why this booking_possible thing is returning true
    # @booking_possible = can_book_celebrity?(current_user, @celebrity)
  end

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.user = current_user
    if @celebrity.save
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @celebrity.update(celebrity_params)
    redirect_to celebrity_path(@celebrity)
  end

  def destroy
    @celebrity.destroy
    redirect_to celebrities_path, status: :see_other
  end

  def myaccount
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

  def celebrity_params
    params.require(:celebrity).permit(:name, :category, :description, :daily_rate, photos: [])
  end

  def find_booking_user(celebrity)
    celebrity.bookings.all.find do |booking|
      if booking.user == current_user
        booking.user
      end
    end
  end


  # def can_book_celebrity?(user, celebrity)
  #   if user.age <= 21 && celebrity.name == "Leonardo Dicaprio"
  #     return false
  #   else
  #     return true
  #   end
  # end
end
