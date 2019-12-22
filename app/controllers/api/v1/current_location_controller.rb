# frozen_string_literal: true

class Api::V1::CurrentLocationController < ApplicationController

  def index
    data = Geocoder.search(request.ip, params: { lang: :ru }).first&.data || {}

    data_json =
      {
        country: data['country'],
        region: data['regionName'],
        city: data['city'],
        postcode: data['zip']
      }

    render json: data_json
  end

  def show
    data = Search::City.by_id(params[:id])

    data_json =
      {
        id: data['id'],
        name: data['name'],
        postcode: data['zip']
      }

    render json: data_json
  end
end
