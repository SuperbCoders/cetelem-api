require 'rails_helper'

RSpec.describe Api::V1::Admin::RegisterController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      headers = { "ACCEPT" => "application/json", "HTTP_ACCEPT" => "application/json" }
      body = '{"role": "user"}'
      post :create, params: body, headers: headers

      expect(response).to have_http_status(:success)
    end
  end

end
