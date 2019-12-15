# frozen_string_literal: true

class Api::V1::Filters::DealerGroupsController < ApplicationController
  def index
    options = DealerGroup.all.as_json(only: [:id, :name])
    options.unshift(id: 0, name: 'Все сети') unless options.empty?

    render json: { dealer_group: { type: 'SELECT', text: 'Сеть', options: options } }
  end

  def dealers
    options = DealerGroup.find(params[:id]).dealers.as_json(only: [:id, :name])
    options.unshift(id: 0, name: 'Все дилеры') unless options.empty?

    render json: { dealer: { type: 'SELECT', text: 'Дилер', options: options } }
  end
end
