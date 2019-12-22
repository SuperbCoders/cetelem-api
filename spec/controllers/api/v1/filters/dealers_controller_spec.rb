# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Filters::DealersController, type: :controller do
  let(:address) { create(:address) }

  describe 'GET #regions' do
    it 'returns http success' do
      id = address.region_id
      get :regions

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.dig('regions', 'options').last['id']).to eq(id)
    end
  end
end
