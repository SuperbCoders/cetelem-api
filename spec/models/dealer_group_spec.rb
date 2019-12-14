# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DealerGroup, type: :model do
  it 'creates entity' do
    expect(create(described_class.table_name.singularize)).to be_valid
  end

  it 'has attached xmls' do
    dealer_group = create(:dealer_group)
    dealer_group.xmls.attach(
      io: File.open("#{fixture_path}/data.xml"),
      filename: 'data.xml',
      content_type: 'application/xml'
    )
    expect(dealer_group.xmls.size).to eq(1)
  end
end
