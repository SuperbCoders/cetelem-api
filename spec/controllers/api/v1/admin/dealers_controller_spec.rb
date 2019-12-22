# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::DealersController, type: :controller do
  let(:admin) { create(:user, role: :admin) }

  let(:dealer) { create(:dealer) }
  let(:dealer_group) { create(:dealer_group) }

  describe 'POST #create' do
    it 'returns http success' do
      sign_in_as(admin)
      post :create, params: dealer.attributes

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns correct body' do
      sign_in_as(admin)
      get :show, params: { id: dealer.id }

      expect(response_json).to include('id' => dealer.id)
    end
  end

  describe 'PATCH #update' do
    it 'returns http success' do
      sign_in_as(admin)
      dealer_group_id = dealer_group.id
      patch :update, params: { id: dealer.id, dealer_group_id: dealer_group_id}

      expect(response).to have_http_status(:success)
      expect(response_json).to include('dealer_group_id' => dealer_group_id)
    end

    it 'updates region_id' do
      sign_in_as(admin)
      address = create(:address, dealer_id: dealer.id)

      patch :update, params: { id: dealer.id, address_attributes:  address.attributes.merge('region_id' => '3300000000000') }

      expect(response).to have_http_status(:success)
      expect(response_json['address']).to include('region_id' => '3300000000000')
    end
  end
end
