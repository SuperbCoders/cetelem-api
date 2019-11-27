# frozen_string_literal: true

module Document
  class Persister
    def initialize(data)
      @data = Array.wrap(data)
    end

    def call
      @data.each do |item|
        persist_brand(item.dig(:car, :brand))
        persist_model(item.dig(:car, :model))
        persist_modification(item.dig(:car, :modification))
        persist_complectation(item.dig(:car, :complectation))
        persist_car(item[:car])
        persist_dealer_car(item.except(:car))
      end
    end

    private

    def persist_brand(item)
      @brand = Brand.find_or_create_by!(item)
    end

    def persist_model(item)
      @model = Model.find_or_create_by!(item.merge!(brand_id: @brand.id))
    end

    def persist_modification(item)
      @modification = Modification.find_or_create_by!(item.merge!(model_id: @model.id))
    end

    def persist_complectation(item)
      @complectation = Complectation.find_or_create_by!(item.merge!(model_id: @model.id))
    end

    def persist_car(item)
      params = {
        brand_id: @brand.id,
        model_id: @model.id,
        modification_id: @modification.id,
        complectation_id: @complectation.id,
        wheel: item[:wheel],
        year: item[:year]
      }

      @car = Car.find_or_create_by!(params)
    end

    def persist_dealer_car(item)
      @dealer_car = DealerCar.create!(item.except(:images).merge(car_id: @car.id))

      @dealer_car.images.create(item[:images])
    end
  end
end
