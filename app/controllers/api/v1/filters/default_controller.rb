# frozen_string_literal: true

class Api::V1::Filters::DefaultController < ApplicationController
  def index
    render json: DefaultFilter.all
  end
end
