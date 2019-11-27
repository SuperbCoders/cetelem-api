# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Document do
  let(:dealer) { create(:dealer) }
  let(:builder) do
    Document::Xml.new(File.read('./spec/fixtures/data.xml'), dealer_id: dealer.id)
  end

  let(:persister) { Document::Persister.new(builder.call) }

  it 'builds data from xml' do
    expect(builder.call.size).to eq(2)
  end

  it 'persists data from xml' do
    persister.call
    expect(DealerCar.count).to eq(2)
  end
end
