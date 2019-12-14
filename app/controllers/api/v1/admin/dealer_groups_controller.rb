# frozen_string_literal: true

class Api::V1::Admin::DealerGroupsController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    paginate json: DealerGroup.all
  end

  def create
    group = DealerGroup.new(dealer_group_params)

    if group.save
      render json: group
    else
      render json: { error: dealer.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def show
    render json: DealerGroup.find(params[:id])
  end

  def update
    group = DealerGroup.find(params[:id])

    if group.update(dealer_group_params)
      render json: group
    else
      render json: { error: dealer.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def destroy
    DealerGroup.find(params[:id]).destroy

    head 204
  end

  private

  def dealer_group_params
    params.permit(:name)
  end
end
