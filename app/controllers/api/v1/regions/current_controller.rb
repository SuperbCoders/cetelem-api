# frozen_string_literal: true

class Api::V1::Regions::CurrentController < ApplicationController

  def index
    render json: Region.find(164)
  end
end
