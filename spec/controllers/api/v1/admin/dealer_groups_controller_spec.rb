# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::DealerGroupsController, type: :controller do
  let(:admin) { create(:user, role: :admin) }

  let(:dealer_1) { create(:dealer) }
  let(:dealer_2) { create(:dealer) }
  let(:group) { create(:dealer_group) }

  describe 'POST #create' do
    it 'returns http success' do
      sign_in_as(admin)
      post :create, params: { name: "Test" }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'PATCH #update' do
    it 'returns http success' do
      sign_in_as(admin)
      patch :update, params: { id: group.id, name: 'new name' }

      expect(response).to have_http_status(:success)
      expect(response_json).to include('name' => 'new name')
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      sign_in_as(admin)
      group.dealers << dealer_1
      group.dealers << dealer_2

      delete :destroy, params: { id: group.id }

      expect(response).to have_http_status(:success)
      expect(DealerGroup.count).to eq(0)
      expect(Dealer.count).to eq(0)
    end
  end
end
