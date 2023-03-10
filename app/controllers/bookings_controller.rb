class BookingsController < ApplicationController
  before_action :set_celebrity, only: [:create, :new, :show]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.celebrity = @celebrity
    @booking.user = current_user
    # ask about where to put this method from Model
    if @booking.save!
      redirect_to celebrity_booking_path(@celebrity, @booking)
    else
      render 'celebrities/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to myaccount_path, status: :see_other
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:celebrity_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_on, :ends_on)
  end

end
