# frozen_string_literal: true

require 'open-uri'

module DealerCarImport
  def self.call(path = "#{Rails.root}/spec/fixtures/data.xml", owner:)
    puts '###### STARTS Uploading DealerCars'

    owner.cars.available.destroy_all

    Nokogiri::XML(File.read(path)).xpath('//car').each do |car_node|
      mark = Mark.find_by(name: car_node.xpath('mark_id').text.squish)
      model = mark.models.find_by(name: car_node.xpath('folder_id').text.squish)
      modification = model.modifications.find_by(name: car_node.xpath('modification_id').text.squish)
      complectation = model.complectations.find_by(name: car_node.xpath('complectation_name').text.squish)
      car = Car.find_by(mark: mark,model: model,modification: modification,complectation: complectation)

      dealer_car =
        owner.cars.create!(
          car: car,
          wheel: car_node.xpath('wheel').text.squish,
          engine_type: car_node.xpath('engine_type').text.squish,
          color: car_node.xpath('color').text.squish,
          metallic: car_node.xpath('metallic').text.squish == "Да",
          availability: car_node.xpath('availability').text.squish,
          custom: car_node.xpath('custom').text.squish == 'растаможен',
          owners_number: car_node.xpath('owners_number').text.squish,
          year: car_node.xpath('year').text.squish,
          registry_year: car_node.xpath('registry_year').text.squish,
          price: car_node.xpath('price').text.squish,
          credit_discount: car_node.xpath('credit_discount').text.squish,
          insurance_discount: car_node.xpath('insurance_discount').text.squish,
          tradein_discount: car_node.xpath('tradein_discount').text.squish,
          max_discount: car_node.xpath('max_discount').text.squish,
          vin: car_node.xpath('vin').text.squish,
          state: car_node.xpath('state')&.text&.squish,
          run: car_node.xpath('vin')&.text&.squish,
          currency: car_node.xpath('currency').text.squish,
          description: car_node.xpath('description').text.squish,
          extra_options: car_node.xpath('extras').text.split(',').
                           map { |i| ExtraOption.find_by(name: i.squish) }.compact
        )
      car_node.xpath('images//image').each do |i|
        downloaded_image = open(i.text)
        downloaded_image.rewind

        dealer_car.images.attach(io: downloaded_image, filename: "car_#{Time.now.to_i}.jpg")
      end
    end

    puts '###### FINISHED Uploading DealerCars'
  end
end
