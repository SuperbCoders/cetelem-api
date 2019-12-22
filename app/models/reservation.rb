# frozen_string_literal: true

class Reservation < ApplicationRecord
  # belongs_to :user
  belongs_to :dealer_car

  before_save do
    self.dealer_id ||= dealer_car.dealer_id
  end

  scope :for_dealer, ->(dealer_id) { where(dealer_id: dealer_id) }

  scope :since, ->(date) { where(created_at: date..Time.now) }

  def self.statistics(dealer_id)
    date = Date.today - 14.days
    data = for_dealer(dealer_id).since(date)

    (date..Date.today).map do |created_at|
      [created_at, data.where("DATE(created_at) = ?", created_at).count]
    end.to_h
  end

  def self.full_statistics
    date = Date.today - 14.days
    data = since(date)

    (date..Date.today).map do |created_at|
      [created_at, data.where("DATE(created_at) = ?", created_at).count]
    end.to_h
  end
end
