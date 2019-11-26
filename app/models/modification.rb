# frozen_string_literal: true

class Modification < ApplicationRecord
  attr_accessor :engine_type, :drive, :gearbox
  validates :engine_type, inclusion: { in: %i[gasolene disel hybrid] }
  validates :drive, inclusion: { in: %i[4wd awd fwd] }
  validates :gearbox, inclusion: { in: %i[robot automat manual] }
  belongs_to :model
end
