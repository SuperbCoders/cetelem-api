# frozen_string_literal: true

class Api::V1::Filters::ModificationsController < ApplicationController
  def index
    model = Mark.find(params[:mark_id]).models.find(params[:model_id])
    options = model.modifications.order(:name).as_json(only: [:id, :name])
    options.unshift(id: 0, name: 'Все модификации') unless options.empty?

    render json: { modification: { type: 'SELECT', text: 'Модификация', options: options } }
  end
end
