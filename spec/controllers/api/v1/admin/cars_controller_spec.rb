require 'rails_helper'

RSpec.describe Api::V1::Admin::CarsController, type: :controller do
  let(:admin) { create(:user, role: :admin) }
  let(:car) { create(:car) }

  before do
    create(:car)
    sign_in_as(admin)
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response_json.size).to eq(1)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: car.id }
      expect(response).to have_http_status(:success)
      expect(response_json).to include('id' => car.id)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      post :update, params: { id: car.id, complectation: "Highline" }

      expect(response).to have_http_status(:success)
      expect(response_json).to include("complectation" => "Highline")
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, params: { id: car.id }
      expect(response).to have_http_status(:success)
      expect(Car.find_by(id: car.id)).to be_nil
    end
  end
end
