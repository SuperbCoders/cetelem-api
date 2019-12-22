# frozen_string_literal: true

class Api::V1::Filters::DealersController < ApplicationController
  def index
    options = Dealer.all.select(:id, :legal_name).map { |i| { id: i.id, name: i.legal_name } }
    options.unshift(id: 0, name: 'Все дилеры') unless options.empty?

    render json: { mark: { type: 'SELECT', text: 'Дилер', options: options } }
  end

  def regions
    options = Address.select(:region_id, :region).distinct.map { |i| { id: i.region_id, name: i.region } }
    options.unshift(id: 0, name: 'Все регионы') unless options.empty?

    render json: { regions: { type: 'SELECT', text: 'Дилер', options: options } }
  end
end
