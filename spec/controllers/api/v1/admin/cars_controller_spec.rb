# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::CarsController, type: :controller do
  let(:admin) { create(:user, role: :admin) }
  let(:car) { create(:car) }

  before do
    create(:car)
    sign_in_as(admin)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response_json.size).to eq(1)
    end

    it 'returns correct by query' do
      get :index, params: { query: car.mark.name }

      expect(response).to have_http_status(:success)
      expect(response_json.size).to eq(1)
    end

    it 'returns empty by query' do
      get :index, params: { query: 'asfcfe' }

      expect(response).to have_http_status(:success)
      expect(response_json.size).to eq(0)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: car.id }
      expect(response).to have_http_status(:success)
      expect(response_json).to include('id' => car.id)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      params = {
        mark: 'Volks', model: 'Tiguan', complectation: 'Highline',
        modification: '2.0 TSI (220лс)', body_type: 'Внедорожник'
      }
      post :create, params: params

      expect(response).to have_http_status(:success)
      expect(response_json).to include('mark' => 'Volks', 'model' => 'Tiguan', 'modification' => '2.0 TSI (220лс)', 'complectation' => 'Highline')
    end

    it 'returns http success with empty complectation' do
      params = {
        mark: 'Volks', model: 'Tiguan', complectation: nil,
        modification: '2.0 TSI (220лс)', body_type: 'Внедорожник'
      }
      post :create, params: params

      expect(response).to have_http_status(:success)
      expect(response_json).to include('mark' => 'Volks', 'model' => 'Tiguan', 'modification' => '2.0 TSI (220лс)', 'complectation' => nil)
    end

    it 'returns http success for full car' do
      params = {
        mark: 'Volkswagen', model: 'Tiguan', complectation: 'Sportline',
        modification: '2.0 TSI (220лс)', body_type: 'Внедорожник', drive: 'Полный', doors_count: 5,
        engine_type: 'Бензин', engine_hp: 220, engine_volume: 2.0, gearbox: 'Автомат робот', years: '2016 - 2019'
      }
      post :create, params: params

      expect(response).to have_http_status(:success)
      expect(response_json).to include(
        'mark' => 'Volkswagen', 'model' => 'Tiguan', 'complectation' => 'Sportline',
        'modification' => '2.0 TSI (220лс)', 'body_type' => 'Внедорожник', 'drive' => 'Полный', 'doors_count' => 5,
        'engine_type' => 'Бензин', 'engine_hp' => 220, 'engine_volume' => 2.0, 'gearbox' => 'Автомат робот', 'years' => '2016 - 2019'
      )
    end
  end

  describe 'PATCH #update' do
    it 'returns http success' do
      car.update(complectation_id: nil)
      post :update, params: { id: car.id, complectation: 'Highline', engine_type: 'Бензин',
                              engine_hp: '249', engine_volume: '2.0', drive: 'Передний', gearbox: 'Автомат' }

      expect(response).to have_http_status(:success)
      expect(response_json).to include('complectation' => 'Highline', 'engine_type' => 'Бензин',
                                       'engine_hp' => 249, 'engine_volume' => 2.0, 'drive' => 'Передний', 'gearbox' => 'Автомат')
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      delete :destroy, params: { id: car.id }
      expect(response).to have_http_status(:success)
      expect(Car.find_by(id: car.id)).to be_nil
    end
  end
end
