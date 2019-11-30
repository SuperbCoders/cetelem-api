# frozen_string_literal: true

class WorkingHourSerializer < ApplicationRecord
  attributes :mon_fr_from, :mon_fr_till, :sat_from, :sat_till, :sun_from, :sun_till
end
