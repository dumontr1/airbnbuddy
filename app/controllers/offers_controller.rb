class OffersController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to root_path
  end

  def show
    @offer = Offer.find(params[:id])
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
