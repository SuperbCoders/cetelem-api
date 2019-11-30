# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DealerCar, type: :model do
  it 'creates entity' do
    expect(create(described_class.table_name.singularize)).to be_valid
  end

  it '#available' do
    create(:dealer_car)
    create(:dealer_car, :full_car)

    expect(described_class.count).to eq(2)
    expect(described_class.available.count).to eq(1)
  end

  it 'has all attributes' do
    car = create(:dealer_car, :full_car)

    expect(car.reservation).to be_present
    expect(car.extra_options).not_to be_empty
    expect(car.images).not_to be_empty
  end
end
