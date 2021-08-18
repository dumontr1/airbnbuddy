class Myoffers::OffersController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_offers = Offer.where(user: current_user)
  end
end
