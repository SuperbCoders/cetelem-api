# frozen_string_literal: true

class Api::V1::Filters::ComplectationsController < ApplicationController
  def index
    model = Mark.find(params[:mark_id]).models.find(params[:model_id])
    options = model.complectations.map { |i| ModificationSerializer.new(i) }
    options.unshift(id: 0, name: 'Все комплектации') unless options.empty?

    render json: { complectation: { type: 'SELECT', text: 'Комплектация', options: options } }
  end
end
