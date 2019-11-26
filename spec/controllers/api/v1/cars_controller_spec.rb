# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  let(:car) { FactoryBot.create(:dealer_car) }
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #show' do
    it 'returns http not_found' do
      get :show, params: { id: 21 }

      expect(response).to have_http_status(:not_found)
    end

    it 'returns http success' do
      get :show, params: { id: car.id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns correct body' do
      get :show, params: { id: car.id }
      expect(JSON.parse(response.body)).to include('id' => car.id)
    end
  end

  describe 'POST #book' do
    it 'returns http success' do
      post :book, params: { id: car.id, user_id: user.id }

      expect(response).to have_http_status(:created)
    end

    it 'returns http bad_request' do
      post :book, params: { id: car.id, user_id: 1 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns http not_found' do
      post :book, params: { id: 1, user_id: 1 }

      expect(response).to have_http_status(:not_found)
    end
  end
end
