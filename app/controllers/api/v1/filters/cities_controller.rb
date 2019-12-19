# frozen_string_literal: true

class Api::V1::Filters::CitiesController < ApplicationController
  def index
    params.require(:query)
    options = Search::City.search_with_parents(query: params[:query])

    render json: { regions: { type: 'SELECT', text: 'Город', options: options } }
  end
end
