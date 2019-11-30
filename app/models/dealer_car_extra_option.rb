# frozen_string_literal: true

class DealerCarExtraOption < ApplicationRecord
  belongs_to :extra_option
  belongs_to :dealer_car
end
