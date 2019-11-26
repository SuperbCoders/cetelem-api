# frozen_string_literal: true

class Api::V1::Cars::ListController < ApplicationController
  def index
    params.require(:available)
    render json: DealerCar.available.as_json
  end

  def show
    render json: DealerCar.available.where(dealer_id: params[:dealer_id]).as_json
  end

  def destroy
    return head 400 unless Dealer.exists?(id: params[:dealer_id])

    DealerCar.available.where(dealer_id: params[:dealer_id]).delete_all

    head :no_content
  end
end
