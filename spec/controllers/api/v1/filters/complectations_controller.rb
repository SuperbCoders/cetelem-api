# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Filters::ComplectationsController, type: :controller do
  let(:complectation) { create(:complectation) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { mark_id: complectation.model.mark.id, model_id: complectation.model_id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.dig('complectation', 'options').first['id']).to eq(complectation.id)
    end
  end
end
