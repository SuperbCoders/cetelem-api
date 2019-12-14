# frozen_string_literal: true

class DealerGroup < ApplicationRecord
  has_many :cars, as: :owner, class_name: :DealerCar, dependent: :destroy
  has_many :dealers

  has_many_attached :xmls
end
