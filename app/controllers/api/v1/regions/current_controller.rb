# frozen_string_literal: true

class Api::V1::Regions::CurrentController < ApplicationController

  def index
    render json: Region.find_by(code: 77)
  end
end
