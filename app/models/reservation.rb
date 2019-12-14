# frozen_string_literal: true

class Reservation < ApplicationRecord
  # belongs_to :user
  belongs_to :dealer_car

  scope :for_dealer, ->(dealer_id) do
    joins(:dealer_car).where(dealer_cars: { owner_id: dealer_id, owner_type: :Dealer })
  end
end
