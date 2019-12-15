require 'rails_helper'

RSpec.describe Api::V1::Admin::DefaultFiltersController, type: :controller do
  let(:admin) { create(:user, role: :admin) }
  let(:filter) { create(:default_filter) }

  before do
    sign_in_as(admin)
  end

  describe "GET #index" do
    it "returns http success" do
      create(:default_filter)
      get :index

      expect(response).to have_http_status(:success)
      expect(response_json.size).to eq(1)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: filter.id }

      expect(response).to have_http_status(:success)
      expect(response_json).to include('id' => filter.id)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      params = {
        title: "new",
        data: {
          mark_id: 1,
          model_id: 1,
          new: 1,
          price: { min: 2018, max: 2019 },
        }
      }
      post :create, params: params

      expect(response).to have_http_status(:success)
      expect(response_json).to include('title', 'data')
      expect(response_json['data']).to include('mark_id', 'model_id', 'new', 'price')
    end
  end

  describe "GET #update" do
    it "returns http success" do
      post :update, params: { id: filter.id, data: { model_id: 2 } }

      expect(response).to have_http_status(:success)
      expect(response_json['data']).to include('model_id' => '2')
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, params: { id: filter.id }

      expect(response).to have_http_status(:success)
      expect(DefaultFilter.exists?(id: filter.id)).to be_falsy
    end
  end
end
