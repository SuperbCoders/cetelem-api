# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::StatisticsController, type: :controller do
  let(:admin) { create(:user, role: :admin) }
  let(:reservation) { create(:reservation) }

  describe 'GET #statistics' do
    it 'returns http success' do
      create(:reservation)

      sign_in_as(admin)
      get :index

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json).to include('cars_total' => 1, 'reservations_total' => 1)
    end
  end
end
