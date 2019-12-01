# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :mark
  belongs_to :model
  belongs_to :modification
  belongs_to :complectation, optional: true

  def full_update(params)
    mark.update(name: params[:mark]) if params[:mark].present?

    model.update(name: params[:model]) if params[:mark].present?

    complectation.update(name: params[:complectation]) if params[:complectation].present?

    modification.update(
      name: params[:modification].presence || modification.name,
      body_type: params[:body_type].presence || modification.body_type,
      years: params[:years].presence || modification.years)
  end
end
