# frozen_string_literal: true

class Api::V1::Filters::RegionsController < ApplicationController
  def index
    params.require(:query)
    options = Search::Region.call(query: params[:query])

    render json: {regions: { type: 'SELECT', text: 'Регион', options: options } }
  end

  def cities
    params.require(:query)
    options = Search::City.call(query: params[:query], region_id: params[:id])

    render json: { regions: { type: 'SELECT', text: 'Город', options: options } }
  end
end
