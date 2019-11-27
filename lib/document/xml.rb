# frozen_string_literal: true

module Document
  class Xml
    def initialize(xml, dealer_id:)
      @data = Hash.from_xml(xml).dig('data', 'cars', 'car')
      @dealer = Dealer.find(dealer_id)
    end

    def call
      @data.map do |item|
        {
          dealer_id: @dealer.id,
          car: {
            brand: {
              name: item['mark_id']
            },
            model: {
              name: item['folder_id'],
              body_type: item['body_type']
            },
            modification: {
              name: item['modification_id'],
              engine_type: :gasolene,
              drive: :awd,
              gearbox: :manual
            },
            complectation: {
              name: item['complectation_name']
            },
            wheel: :left,
            year: item['year'].to_i
          },
          color: item['color'],
          metallic: item['metallic'] == 'Да',
          availability: item['availability'],
          custom: item['custom'].downcase == 'растаможен',
          owners_number: item['owners_number'].gsub(/^не.*/i, '0').to_i,
          price: item['price'].to_i,
          credit_discount: item['credit_discount'].to_i,
          insurance_discount: item['insurance_discount'].to_i,
          tradein_discount: item['tradein_discount'].to_i,
          max_discount: item['max_discount'].to_i,
          currency: 'rub',
          registry_year: item['registry_year'].to_i,
          vin: item['vin'],
          description: item['description'],
          images: item['images']['image'].map { |i| { url: i } }
        }
      end
    end
  end
end
