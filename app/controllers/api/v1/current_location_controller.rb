# frozen_string_literal: true

class Api::V1::CurrentLocationController < ApplicationController

  def index
    request.location.data
  end
end
