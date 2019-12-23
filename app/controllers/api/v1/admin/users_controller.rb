# frozen_string_literal: true

class Api::V1::Admin::UsersController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: { error: user.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: { error: user.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    head 204
  end

  private

  def user_params
    params.permit(:login, :password, :role, :dealer_id)
  end
end
