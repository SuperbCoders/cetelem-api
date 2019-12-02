# frozen_string_literal: true

class Api::V1::Filters::ModelsController < ApplicationController
  def index
    mark = Mark.find(params[:mark_id])
    options = mark.models.map { |i| ModelSerializer.new(i) }

    render json: { model: { type: 'SELECT', text: 'Модель', options: options } }
  end
end
