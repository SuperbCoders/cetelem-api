# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :mark
  belongs_to :model
  belongs_to :modification
  belongs_to :complectation, optional: true

  # validates :year, numericality: { only_integer: true }
  # validates :wheel, inclusion: { in: %i[left right] }

  def to_builder
    Jbuilder.new do |car|
      car.(self, *DealerCar.column_names)
      car.extra_options(self.extra_options, :code, :name)
      car.images(self.images, :url)
      car.reservation(self.reservation, :phone, :email, :user_id, :created_at) if car.reservation
    end
  end
end
