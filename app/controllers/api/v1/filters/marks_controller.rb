# frozen_string_literal: true

class Api::V1::Filters::MarksController < ApplicationController
  def index
    options = Mark.all.as_json(only: [:id, :name])
    options.unshift(id: 0, name: 'Все марки') unless options.empty?

    render json: { mark: { type: 'SELECT', text: 'Марка', options: options } }
  end
end
