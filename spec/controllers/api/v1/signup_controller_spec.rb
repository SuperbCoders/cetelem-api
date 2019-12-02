# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SignupController, type: :controller do
  describe 'GET #create' do
    it 'returns http success' do
      headers = { 'ACCEPT' => 'application/json', 'HTTP_ACCEPT' => 'application/json' }
      body = { login: 'abc', password: 'ouvnwibds2321', "role": 'user' }

      request.headers.merge!(headers)
      post :create, params: body

      expect(response).to be_successful
      expect(JSON.parse(response.body).keys).to eq ['csrf', 'user']
      expect(response.cookies[JWTSessions.access_cookie]).to be_present
    end
  end
end
