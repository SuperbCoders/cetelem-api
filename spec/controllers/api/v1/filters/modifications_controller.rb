# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Filters::ModificationsController, type: :controller do
  let(:modification) { create(:modification) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { mark_id: modification.model.mark.id, model_id: modification.model_id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.dig('modification', 'options').first['id']).to eq(modification.id)
    end
  end
end
