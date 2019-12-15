# frozen_string_literal: true

class Api::V1::Admin::DefaultFiltersController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    render json: DefaultFilter.all
  end

  def create
    dealer = DefaultFilter.new(filter_params)

    if dealer.save
      render json: dealer
    else
      render json: { error: dealer.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def show
    render json: DefaultFilter.find(params[:id])
  end

  def update
    DefaultFilter.find(params[:id]).tap do |filter|
      if filter.update(filter_params)
        render json: filter
      else
        render json: { error: filter.errors.full_messages.join(' ') },
               status: :unprocessable_entity
      end
    end
  end

  def destroy
    DefaultFilter.find(params[:id]).destroy

    head 204
  end

  private

  def filter_params
    params.permit(:title, data: [:mark_id, :model_id, :new, price: %i[min max]])
  end
end
