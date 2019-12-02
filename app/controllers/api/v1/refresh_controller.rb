# frozen_string_literal: true

class Api::V1::RefreshController < ApplicationController
  before_action :authorize_refresh_by_access_request!

  def create
    user = User.find_by(id: claimless_payload['user_id'])
    raise JWTSessions::Errors::Unauthorized unless User

    session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
    tokens = session.refresh_by_access_payload do
      raise JWTSessions::Errors::Unauthorized, 'Malicious activity detected'
    end

    response.set_cookie(JWTSessions.access_cookie,
                        value: tokens[:access],
                        httponly: true,
                        secure: Rails.env.production?)

    render json: { csrf: tokens[:csrf], user: UserSerializer.new(user) }
  end
end
