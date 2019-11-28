# frozen_string_literal: true

class ContactInfo < ApplicationRecord
  belongs_to :dealer, optional: true
  belongs_to :user, optional: true

  validates :value, presence: true
  validates :value_type, inclusion: { in: %w[phone email fax] }
end
