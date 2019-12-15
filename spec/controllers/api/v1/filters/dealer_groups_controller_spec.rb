# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Filters::DealerGroupsController, type: :controller do
  let(:group) { create(:dealer_group) }

  describe 'GET #index' do
    it 'returns http success' do
      id = group.id
      get :index

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.dig('dealer_group', 'options').last['id']).to eq(id)
    end
  end

  describe 'GET #index' do
    it 'returns http success' do
      dealer_id = group.dealers.last.id
      get :dealers, params: { id: group.id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response_json.dig('dealer', 'options').last['id']).to eq(dealer_id)
    end
  end
end
