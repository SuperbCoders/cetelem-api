# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DealersController, type: :controller do
  let(:dealer) { FactoryBot.create(:dealer) }
  let(:reservation) { FactoryBot.create(:reservation) }

  describe 'GET #show' do
    it 'returns http not_found' do
      get :show, params: { id: 21 }

      expect(response).to have_http_status(:not_found)
    end

    it 'returns http success' do
      get :show, params: { id: dealer.id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns correct body' do
      get :show, params: { id: dealer.id }

      expect(JSON.parse(response.body)).to include('id' => dealer.id)
    end
  end

  describe 'GET #reservations' do
    it 'returns http bad_request' do
      get :reservations, params: { dealer_id: 21 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns http success' do
      dealer_id = reservation.dealer_car.dealer_id
      get :reservations, params: { dealer_id: dealer_id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns empty body' do
      get :reservations, params: { dealer_id: dealer.id }

      expect(JSON.parse(response.body).size).to eq(0)
    end

    it 'returns correct body' do
      dealer_id = reservation.dealer_car.dealer_id
      get :reservations, params: { dealer_id: dealer_id }

      expect(JSON.parse(response.body).first).to include('id' => reservation.id)
    end
  end
end
