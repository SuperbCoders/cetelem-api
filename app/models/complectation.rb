# frozen_string_literal: true

class Complectation < ApplicationRecord
  belongs_to :modification

  validates :name, presence: true
end
