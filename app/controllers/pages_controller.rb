class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :offers]

  def home
    @offers= Offer.all
  end

  # def offers
  # end
end
