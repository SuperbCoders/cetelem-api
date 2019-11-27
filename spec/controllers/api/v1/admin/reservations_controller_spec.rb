# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::ReservationsController, type: :controller do
  let(:admin) { create(:user, role: :admin) }
  let(:reservation) { create(:reservation, user_id: admin.id) }

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

  describe 'GET #show' do
    it 'returns not_authorized' do
      get :show, params: { id: 1 }

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns not_found' do
      sign_in_as(admin)
      get :show, params: { id: 0 }

      expect(response).to have_http_status(:not_found)
    end

    it 'returns http success' do
      sign_in_as(admin)
      get :show, params: { id: reservation.id }
      expect(response).to have_http_status(:success)
    end
  end
end
