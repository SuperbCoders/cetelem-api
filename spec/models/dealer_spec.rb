# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dealer, type: :model do
  it 'creates entity' do
    expect(create(described_class.table_name.singularize)).to be_valid
  end

  it 'creates full dealer' do
    expect(create(:dealer, :full)).to be_valid
  end

  it 'has attached xmls' do
    dealer = create(:dealer)
    dealer.xmls.attach(
      io: File.open("#{fixture_path}/data.xml"),
      filename: 'data.xml',
      content_type: 'application/xml'
    )
    expect(dealer.xmls.size).to eq(1)
  end
end
