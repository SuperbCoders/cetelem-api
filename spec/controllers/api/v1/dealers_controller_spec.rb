# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DealersController, type: :controller do
  let(:dealer) { create(:dealer) }
  let(:reservation) { create(:reservation) }
  let(:dealer_car) { create(:dealer_car) }

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

      expect(response_json).to include('id' => dealer.id)
    end
  end

  describe 'GET #reservations' do
    it 'returns http not_found' do
      get :reservations, params: { dealer_id: 21 }

      expect(response).to have_http_status(:not_found)
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

  describe 'GET #cars' do
    it 'returns http success' do
      get :cars, params: { id: dealer.id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json).to be_empty
    end

    it 'returns correct body' do
      get :cars, params: { id: dealer_car.dealer_id }

      expect(response).to have_http_status(:success)
      expect(response_json).not_to be_empty
    end

    it 'returns http not_found' do
      get :cars, params: { id: 0 }

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #upload' do
    it 'returns http success' do
      file = fixture_file_upload('data.xml', 'text/xml')
      post :upload_xml, params: { id: dealer.id, xml: file }

      expect(response).to have_http_status(:accepted)
      expect(dealer.xmls.count).to eq(1)
    end
  end
end
