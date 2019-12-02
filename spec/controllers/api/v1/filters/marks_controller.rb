# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Filters::MarksController, type: :controller do
  let(:mark) { create(:mark) }

  describe 'GET #index' do
    it 'returns http success' do
      id = mark.id
      get :index

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.dig('mark', 'options').first['id']).to eq(id)
    end
  end
end
