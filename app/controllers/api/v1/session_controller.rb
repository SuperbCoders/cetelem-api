# frozen_string_literal: true

class Api::V1::SessionController < ApplicationController
  def create
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      payload = { user_id: user.id, roles: [user.role] }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)

      render json: { csrf: tokens[:csrf] }
    else
      not_authorized
    end
  end

  private

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end
end
