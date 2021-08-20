class OffersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      if params[:query].present?
        sql_query = " \
          offers.title @@ :query \
          OR offers.details @@ :query \
        "
        @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
      else
        @offers = Offer.where('user_id != ?', current_user.id)
      end
    else
      if params[:query].present?
        sql_query = " \
          offers.title @@ :query \
          OR offers.details @@ :query \
        "
        @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
      else
        @offers = Offer.all
      end
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to root_path
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
  end


  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    redirect_to offer_path(@offer)
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :details, :price)
  end
end
