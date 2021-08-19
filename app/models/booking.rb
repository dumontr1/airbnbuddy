class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  enum status: {
    refused: 0,
    pending: 1,
    validated: 2
  }
end
