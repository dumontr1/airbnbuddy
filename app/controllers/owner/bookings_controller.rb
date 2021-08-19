class Owner::BookingsController < ApplicationController
  def index
    @my_bookings = Booking.where(user_id: current_user)
    @offers = Offer.all
  end
end
