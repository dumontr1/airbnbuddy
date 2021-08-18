class Owner::BookingsController < ApplicationController

  def index
    @offers = current_user.offers
  end
end
