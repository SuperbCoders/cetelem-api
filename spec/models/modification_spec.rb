# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Modification, type: :model do
  it 'creates entity' do
    expect(FactoryBot.create(described_class.table_name.singularize)).to be_valid
  end
end
