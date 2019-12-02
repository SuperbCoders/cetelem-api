# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SessionController, type: :controller do
  describe 'GET #create' do
    let(:user) { create(:user) }
    let(:user_params) { { login: user.login, password: user.password } }

    it 'returns http success' do
      post :create, params: user_params

      expect(response).to be_successful
      expect(response_json.keys).to eq ['csrf', 'user']
      expect(response.cookies[JWTSessions.access_cookie]).to be_present
    end

    it 'returns unauthorized for invalid params' do
      post :create, params: { login: user.login, password: 'incorrect' }

      expect(response).to have_http_status(401)
    end
  end
end
