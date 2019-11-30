# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DealerCarsController, type: :controller do
  let(:car) { create(:dealer_car) }
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.size).to eq(0)
    end

    it 'returns correct body' do
      create(:dealer_car)
      get :index

      expect(response_json.size).to eq(1)
    end

    it 'doesnt return reservated cars' do
      create(:dealer_car, :full_car)
      id = car.id
      get :index

      expect(response_json.size).to eq(1)
      expect(response_json.first).to include('id' => id)
    end
  end

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
binding.pry
      expect(response_json).to include('id' => car.id)
      expect(response_json['extra_options']).to be_a(Array)
      expect(response_json['images']).to be_a(Array)
      expect(response_json).to have_key('reservation')
      expect(response_json).to have_key('car')
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

  describe 'GET #filters' do
    it 'returns http success' do
      get :filters
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy_list' do
    it 'returns http no_content' do
      delete :destroy_list, params: { dealer_id: car.dealer_id }

      expect(response).to have_http_status(:no_content)
    end

    it 'returns http bad_request' do
      delete :destroy_list, params: { dealer_id: 1 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'deletes data' do
      create(:dealer_car)

      delete :destroy_list, params: { dealer_id: car.dealer_id }

      expect(DealerCar.available.where(dealer_id: car.dealer_id).count).to eq(0)
      expect(DealerCar.available.count).to eq(1)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http not_found' do
      delete :destroy, params: { id: 0 }

      expect(response).to have_http_status(:not_found)
    end

    it 'deletes data' do
      delete :destroy, params: { id: car.id }

      expect(response).to have_http_status(:success)
    end
  end
end
