require 'rails_helper'

RSpec.describe DealerCarImport do
  let (:dealer) { create(:dealer) }
  before do
    CarImport.call("#{Rails.root}/spec/fixtures/cars.xml")
    YAML::load(File.open("#{Rails.root}/db/data/extra_options.yaml")).each do |type, names|
      ExtraOption.import(names.map { |name| { name: name, type: type } })
    end
  end

  it 'persists dealer cars' do
    described_class.call("#{Rails.root}/spec/fixtures/data.xml", dealer: dealer)

    expect(dealer.dealer_cars.count).to eq(2)

    car = dealer.dealer_cars.first

    expect(car.attributes).to include(
      "color"=>"белый",
      "wheel"=>"Левый",
      "engine_type"=>"Бензин",
      "metallic"=>false,
      "availability"=>"в наличии",
      "custom"=>true,
      "owners_number"=>"Не было владельцев",
      "price"=>1216990,
      "credit_discount"=>10000,
      "insurance_discount"=>1500,
      "tradein_discount"=>60000,
      "max_discount"=>50000,
      "currency"=>"RUR",
      "year" => 2016,
      "registry_year" => 2017,
      "vin" => "SJNSSAF15U7368814"
    )
    expect(car.car.mark.name).to eq("Nissan")
    expect(car.car.model.name).to eq("Juke, I Рестайлинг")
    expect(car.car.modification.name).to eq("1.6 CVT (117 л.с.)")
    expect(car.car.complectation.name).to eq("LE")
    expect(car.extra_options.count).to eq(4)
    expect(car.images.count).to eq(1)
  end

  # it 'it reloads data correctly' do
  #   3.times { described_class.call("#{Rails.root}/spec/fixtures/cars.xml") }
  #
  #   expect(Model.count).to eq(3)
  #   expect(Modification.count).to eq(7)
  #   expect(Complectation.count).to eq(4)
  #   expect(Car.count).to eq(16)
  # end
end
