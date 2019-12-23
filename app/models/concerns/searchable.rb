# frozen_string_literal: true

require 'active_support/concern'

module Searchable
  extend ActiveSupport::Concern

  included do
    scope :where_name, lambda { |query|
      return all if query.blank?

      query.squish!.upcase!
      joins(:mark).joins(:model).where("UPPER(CONCAT_WS(' ', marks.name, models.name))  LIKE ?", "%#{query}%")
    }
  end
end
