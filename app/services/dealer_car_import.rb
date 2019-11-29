# frozen_string_literal: true

module DealerCarImport
  def self.call(path = "#{Rails.root}/spec/fixtures/data.xml", dealer: Dealer.first)
    puts '###### STARTS Uploading DealerCars'

    dealer.dealer_cars.destroy_all

    Nokogiri::XML(File.read(path)).xpath('//car').each do |car_node|
      mark = Mark.find_by(name: car_node.xpath('mark_id').text)
      model = mark.models.find_by(name: car_node.xpath('folder_id').text)
      modification = model.modifications.find_by(name: car_node.xpath('modification_id').text)
      complectation = model.complectations.find_by(name: car_node.xpath('complectation_name').text)
      car = Car.find_by(mark: mark,model: model,modification: modification,complectation: complectation)

      dealer_car = DealerCar.create!(
        car: car, dealer: dealer,
        wheel: car_node.xpath('wheel').text,
        engine_type: car_node.xpath('engine_type').text,
        color: car_node.xpath('color').text,
        metallic: car_node.xpath('metallic').text == "Да",
        availability: car_node.xpath('availability').text,
        custom: car_node.xpath('custom').text == 'растаможен',
        owners_number: car_node.xpath('owners_number').text,
        year: car_node.xpath('year').text,
        registry_year: car_node.xpath('registry_year').text,
        price: car_node.xpath('price').text,
        insurance_discount: car_node.xpath('insurance_discount').text,
        tradein_discount: car_node.xpath('tradein_discount').text,
        max_discount: car_node.xpath('max_discount').text,
        vin: car_node.xpath('vin').text,
        currency: car_node.xpath('currency').text,
        description: car_node.xpath('description').text,
      )
    end

    puts '###### FINISHED Uploading DealerCars'
  end
end
