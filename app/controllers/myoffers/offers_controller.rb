class Myoffers::OffersController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_offers = Offer.where(user: current_user)
  end

  def show
    @my_offer = Offer.find(params[:id])
    @bookings = Booking.where(offer_id: @my_offer.id)
  end

  def destroy
    @my_offer = Offer.find(params[:id])
    @my_offer.destroy
    redirect_to myoffers_offers_path
  end
end
