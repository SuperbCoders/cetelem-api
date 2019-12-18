# frozen_string_literal: true

class Api::V1::CurrentLocationController < ApplicationController

  def index
    data = Geocoder.search(request.ip, params: { lang: :ru }).first&.data

    render json: data.as_json(only: %w[country regionName city zip lat lon])
  end
end
