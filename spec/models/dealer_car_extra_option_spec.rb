# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DealerCarExtraOption, type: :model do
  it 'creates entity' do
    expect(create(described_class.table_name.singularize)).to be_valid
  end
end