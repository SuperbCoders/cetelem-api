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
      dealer = create(:dealer)
      car = dealer.cars.create(dealer_car_params.except(:dealer_id))
      patch :update, params: { id: car.id, availability: 'отсутствует' }

      expect(response).to have_http_status(:success)
      expect(response_json).to include('availability' => 'отсутствует')
    end

    it 'it sets new owners' do
      sign_in_as(admin)

      dealer = create(:dealer)
      group = create(:dealer_group)
      car = dealer.cars.create(dealer_car_params.except(:dealer_id))

      patch :update, params: { id: car.id, dealer_group_id: group.id }

      expect(response).to have_http_status(:success)
      expect(response_json).to include(
        'dealer_group_id' => group.id,
        'owner_type' => 'DealerGroup')
    end

    it 'returns unprocessable_entity' do
      sign_in_as(admin)

      car = create(:dealer_car)

      patch :update, params: { id: car.id, dealer_group_id: 0 }
      expect(response).to have_http_status(:unprocessable_entity)

      patch :update, params: { id: car.id, dealer_id: 0 }
      expect(response).to have_http_status(:unprocessable_entity)
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
