class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: :current_user)
  end

  def update
    @booking = Booking.find(params[:offer_id])
    if params[:user_action] == "validate"
      @booking.validated!
    else
      @booking.refused!
    end
    redirect_to myoffers_offer_path(@booking.offer)
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    @booking.pending!
    if @booking.save
      redirect_to owner_bookings_path
    else
      render 'offers/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
