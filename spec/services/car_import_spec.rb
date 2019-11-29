require 'rails_helper'

RSpec.describe CarImport do
  it 'persists cars' do
    described_class.call("#{Rails.root}/spec/fixtures/cars.xml")
    expect(Mark.count).to eq(2)

    expect(Model.count).to eq(3)
    expect(Modification.count).to eq(7)
    expect(Complectation.count).to eq(4)
    expect(Car.count).to eq(16)
  end

  it 'it reloads data correctly' do
    3.times { described_class.call("#{Rails.root}/spec/fixtures/cars.xml") }

    expect(Model.count).to eq(3)
    expect(Modification.count).to eq(7)
    expect(Complectation.count).to eq(4)
    expect(Car.count).to eq(16)
  end
end
