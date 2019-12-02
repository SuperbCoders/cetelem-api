# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Filters::ModelsController, type: :controller do
  let(:model) { create(:model) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { mark_id: model.mark.id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.dig('model', 'options').last['id']).to eq(model.id)
    end
  end
end
