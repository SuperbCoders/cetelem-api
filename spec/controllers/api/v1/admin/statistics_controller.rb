# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::DealersController, type: :controller do
  let(:admin) { create(:user, role: :admin) }

  describe 'GET #statistics' do
    it 'returns http success' do
      create(:reservation)

      sign_in_as(admin)
      get :statistics

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json).to include('cars_total' => 1, 'reservations_total' => 1)
    end

    it 'returns statistics for dealer' do
      dealer_id = reservation.dealer_car.dealer_id

      sign_in_as(admin)
      get :statistics, { params: { dealer_id: dealer_id } }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json).to include('cars_total' => 1, 'reservations_total' => 1)
    end
  end
end
