# frozen_string_literal: true

require 'active_support/concern'

module Queryable
  extend ActiveSupport::Concern

  included do
    scope :where_car, lambda { |params|
      return all if params.empty?

      joins(:car).where(cars: params)
    }

    scope :where_dealer_car, lambda { |params|
      return all if params.empty?

      where(params)
    }

    scope :where_modifications, lambda { |params|
      return all if params.empty?

      modification_ids = Modification.where(params).pluck(:id)
      joins(:car).where(cars: { modification_id: modification_ids })
    }

    scope :where_address, lambda { |params|
      return all if params.empty?

      dealer_ids = Address.where(params).pluck(:dealer_id)
      where(owner_id: dealer_ids, owner_type: 'Dealer')
    }
  end
end
