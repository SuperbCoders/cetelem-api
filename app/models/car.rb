# frozen_string_literal: true

class Car < ApplicationRecord
  include Searchable

  belongs_to :mark
  belongs_to :model
  belongs_to :modification
  belongs_to :complectation, optional: true

  has_many :dealer_cars

  def full_update(params)
    mark.update(name: params[:mark]) if params[:mark].present?

    model.update(name: params[:model]) if params[:mark].present?

    complectation.update(name: params[:complectation]) if params[:complectation].present?

    modification.update(
      name: params[:modification].presence || modification.name,
      body_type: params[:body_type].presence || modification.body_type,
      years: params[:years].presence || modification.years
    )
  end

  def self.full_create(params)
    transaction do
      mark = Mark.find_or_create_by!(name: params[:mark])
      model = mark.models.find_or_create_by!(name: params[:model])
      modification =model.modifications.find_or_create_by!(
        name: params[:modification],
        body_type: params[:body_type],
        doors_count: params[:doors_count],
        drive: params[:drive],
        years: params[:years])
      complectation = model.complectations.find_or_create_by!(name: params[:complectation])

      create(mark: mark, model: model, complectation: complectation, modification: modification)
    end
  end
end
