require 'rails_helper'

RSpec.describe CarImport do
  it 'persists cars' do
    described_class.call("#{Rails.root}/spec/fixtures/cars.xml")

    expect(Mark.count).to eq(3)
    expect(Model.count).to eq(5)
    expect(Model.find_by(name: "Octavia, III").modifications.count).to eq(3)
    expect(Model.find_by(name: "Favorit").modifications.count).to eq(2)
    expect(Model.find_by(name: "Massif").modifications.count).to eq(2)
    expect(Model.find_by(name: "Juke, I Рестайлинг").modifications.count).to eq(8)
    expect(Model.find_by(name: "Qashqai, II").modifications.count).to eq(10)
    expect(Model.find_by(name: "Qashqai, II").complectations.count).to eq(11)
  end

  it 'it reloads data correctly' do
    3.times { described_class.call("#{Rails.root}/spec/fixtures/cars.xml") }

    expect(Model.count).to eq(5)
    expect(Modification.count).to eq(25)
    expect(Complectation.count).to eq(29)
    expect(Car.count).to eq(238)
  end
end
