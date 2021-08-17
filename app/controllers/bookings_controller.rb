class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: :current_user)
  end

  def create
    @offer = Offer.find(params[:offer_id]) #a vérifier
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = 1
    if @booking.save
      redirect_to owner_bookings_path
    else
      render 'offers/show'
    end
  end

  def update

  end

  private

  def booking_params
    params.require(:booking).permit(:status, :id_offer, :start_date, :end_date)
  end
end
