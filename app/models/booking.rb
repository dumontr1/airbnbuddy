class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  enum status: {
    declined: 0,
    pending: 1,
    booked: 2
  }
end
