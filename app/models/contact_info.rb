# frozen_string_literal: true

class ContactInfo < ApplicationRecord
  attr_accessor :value, :value_type

  belongs_to :dealer, optional: true
  belongs_to :user, optional: true

  validates :value, presence: true
  validates :value_type, inclusion: { in: %i[phone email fax] }
end
