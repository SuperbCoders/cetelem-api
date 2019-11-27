class Api::V1::Admin::RegisterController < ApplicationController
  def create
    User.create(params.require(:role))
  end
end
