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
end
