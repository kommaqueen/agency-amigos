class BookingsController < ApplicationController
  before_action :set_celebrity

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.celebrity = @celebrity
    @booking.user = current_user
    # ask about where to put this method from Model
    current_user.booking_conflict?
    if @booking.save!
      redirect_to celebrity_booking_path(@celebrity, @booking)
    else
      render 'celebrities/show', status: :unprocessable_entity
    end
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

  def compare_date
    # goal is if conflict, return false
    # if no conflict, return true

    # get start chosen date
    # get end chosen date
    # get array of sorted existing bookings, sorted by start date

    @start_chosen_date = Date.new(params[:booking]["start_date(1i)"].to_i, params[:booking]["start_date(2i)"].to_i,
                                  params[:booking]["start_date(3i)"].to_i)
    @end_chosen_date = Date.new(params[:booking]["end_time(1i)"].to_i, params[:booking]["end_time(2i)"].to_i,
                                params[:booking]["end_time(3i)"].to_i)
    sorted_bookings = @celebrity.bookings.sort_by(&:start_date)
    return true if sorted_bookings.empty?
    return true if @end_chosen_date < sorted_bookings.first.start_date
    return true if @start_chosen_date > sorted_bookings.last.end_time
    sorted_bookings.each_with_index do |booking, i|
      # start_booked_date = booking.start_date
      end_booked_date = booking.end_time
      if (i != sorted_bookings.length - 1) && ((@start_chosen_date > end_booked_date) && (@end_chosen_date < sorted_bookings[i + 1].start_date))
        return true
      end
    end
    false
  end

end
