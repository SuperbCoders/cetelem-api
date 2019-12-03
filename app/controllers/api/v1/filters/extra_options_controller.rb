# frozen_string_literal: true

class Api::V1::Filters::ExtraOptionsController < ApplicationController
  def index
    response =
      ExtraOption.all.select(:id, :name, :type).group_by(&:type).transform_values do |i|
        { type: 'SELECT', options: i.as_json(only: [:id, :name]).unshift(id: 0, name: 'Все') }
      end

    render json: response
  end
end
