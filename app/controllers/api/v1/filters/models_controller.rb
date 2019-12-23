# frozen_string_literal: true

class Api::V1::Filters::ModelsController < ApplicationController
  def index
    mark = Mark.find(params[:mark_id])
    options = mark.models.order(:name).as_json(only: [:id, :name])
    options.unshift(id: 0, name: 'Все модели') unless options.empty?

    render json: { model: { type: 'SELECT', text: 'Модель', options: options } }
  end
end
