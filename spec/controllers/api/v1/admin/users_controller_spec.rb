# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::UsersController, type: :controller do
  let(:admin) { FactoryBot.create(:user, role: :admin) }

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

    it 'returns users' do
      sign_in_as(admin)
      get :index

      expect(response_json.size).to eq(1)
      expect(response_json.first).to include(
        'id' => admin.id, 'login' => admin.login, 'role' => admin.role
      )
    end
  end

  describe 'POST #create' do
    it 'returns not_authorized' do
      post :create

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns unprocessable_entity' do
      sign_in_as(admin)
      post :create, params: { login: admin.login, password: 'vbudbvuub123', role: :admin }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_json['error']).to eq('Login has already been taken')
    end

    it 'returns success' do
      sign_in_as(admin)
      post :create, params: { login: 'new_login', password: 'vbudbvuub123', role: :admin }

      expect(response).to have_http_status(:success)
      expect(response_json).to include('login' => 'new_login', 'role' => 'admin')
    end
  end

  describe 'PATCH #update' do
    it 'returns unprocessable_entity' do
      sign_in_as(admin)
      user = FactoryBot.create(:user, login: 'new', role: :user)
      patch :update, params: { id: user.id, login: admin.login, password: 'vbudbvuub123', role: :admin }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns unprocessable_entity' do
      sign_in_as(admin)
      user = FactoryBot.create(:user, login: 'login', role: :user)
      patch :update, params: { id: user.id, login: 'new_login', password: 'NewPassword1312', role: :admin }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http not_found' do
      sign_in_as(admin)
      delete :destroy, params: { id: 0 }

      expect(response).to have_http_status(:not_found)
    end

    it 'returns http success' do
      sign_in_as(admin)
      user = FactoryBot.create(:user, login: 'login', role: :user)
      delete :destroy, params: { id: user.id }

      expect(response).to have_http_status(:success)
    end
  end
end
