# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::DealerCarsController, type: :controller do
  let(:admin) { create(:user, role: :admin) }
  let(:dealer_car) { create(:dealer_car) }
  let(:dealer_car_build) { build(:dealer_car) }
  let(:dealer_car_params) do
    {
      color: '0R0R',
      metallic: false,
      availability: 'в наличии',
      custom: true,
      owners_number: 0,
      price: 1_900_000,
      credit_discount: 100_000,
      insurance_discount: 100_000,
      tradein_discount: 100_000,
      max_discount: 300_000,
      currency: 'rub',
      description: 'Продажа авто',
      registry_year: 2019,
      vin: 'WVWZ****ZJE2*****',
      dealer_id: create(:dealer).id,
      car_id: create(:car).id
    }
  end

  describe 'GET #index' do
    it 'returns not_authorized' do
      get :index

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns http success' do
      sign_in_as(admin)
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns not_authorized' do
      post :create, params: dealer_car_build.attributes

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns http success' do
      sign_in_as(admin)
      post :create, params: dealer_car_params

      expect(response).to have_http_status(:success)
    end

    it 'creates car' do
      sign_in_as(admin)

      expect { post(:create, params: dealer_car_params) }
        .to change { DealerCar.count }.by(1)
    end
  end

  describe 'GET #show' do
    it 'returns not_authorized' do
      get :show, params: { id: dealer_car.id }

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns http success' do
      sign_in_as(admin)
      get :show, params: { id: dealer_car.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    it 'returns not_authorized' do
      patch :update, params: { id: dealer_car.id }

      expect(response).to have_http_status(:unauthorized)
    end

    it 'updates entity' do
      sign_in_as(admin)
      car = DealerCar.create(dealer_car_params)
      patch :update, params: { id: car.id, availability: 'отсутствует' }

      expect(response).to have_http_status(:success)
      expect(response_json).to include('availability' => 'отсутствует')
    end
  end

  describe 'DELETE #destroy' do
    it 'returns not_authorized' do
      delete :destroy, params: { id: dealer_car.id }

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns http success' do
      sign_in_as(admin)
      delete :destroy, params: { id: dealer_car.id }

      expect(response).to have_http_status(:success)
    end

    it 'deletes car' do
      sign_in_as(admin)
      dealer_car_build.save
      expect { delete(:destroy, params: { id: dealer_car_build.id }) }
        .to change { DealerCar.count }.from(1).to(0)
    end
  end
end
