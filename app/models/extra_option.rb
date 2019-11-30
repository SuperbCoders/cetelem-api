# frozen_string_literal: true

class ExtraOption < ApplicationRecord
  self.inheritance_column = :_type_disabled

  validates :name, uniqueness: { case_sensitive: false }
end
