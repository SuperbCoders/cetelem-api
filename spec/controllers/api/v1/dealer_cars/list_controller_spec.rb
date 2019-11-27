# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DealerCars::ListController, type: :controller do
  let(:dealer_car) { create(:dealer_car) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { available: true }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns http bad_request' do
      get :index

      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { dealer_id: 1 }

      expect(response).to have_http_status(:success)
    end

    it 'returns correct body' do
      get :show, params: { dealer_id: dealer_car.dealer_id }

      expect(JSON.parse(response.body).first).to include('id' => dealer_car.id)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http no_content' do
      delete :destroy, params: { dealer_id: dealer_car.dealer_id }

      expect(response).to have_http_status(:no_content)
    end

    it 'returns http bad_request' do
      delete :destroy, params: { dealer_id: 1 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'deletes data' do
      create(:dealer_car)

      delete :destroy, params: { dealer_id: dealer_car.dealer_id }

      expect(DealerCar.available.where(dealer_id: dealer_car.dealer_id).count).to eq(0)
      expect(DealerCar.available.count).to eq(1)
    end
  end
end
