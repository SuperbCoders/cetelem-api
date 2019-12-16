# frozen_string_literal: true

class Api::V1::Filters::RegionsController < ApplicationController
  def index
    options = Region.all.order(:code).as_json(only: [:id, :name])
    options.unshift(id: 0, name: 'Все регионы')

    render json: {regions: { type: 'SELECT', text: 'Регион', options: options } }
  end
end
