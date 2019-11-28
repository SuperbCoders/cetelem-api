# frozen_string_literal: true

module Document
  class Persister
    def initialize(data)
      @data = Array.wrap(data)
    end

    def call
      @data.each do |item|
        persist_mark(item.dig(:car, :mark))
        persist_model(item.dig(:car, :model))
        persist_modification(item.dig(:car, :modification))
        persist_complectation(item.dig(:car, :complectation))
        persist_car(item[:car])
        persist_dealer_car(item.except(:car))
      end
    end

    private

    def persist_mark(item)
      @mark = Mark.find_or_create_by!(item)
    end

    def persist_model(item)
      @model = Model.find_or_create_by!(item.merge!(mark_id: @mark.id))
    end

    def persist_modification(item)
      @modification = Modification.find_or_create_by!(item.merge!(model_id: @model.id))
    end

    def persist_complectation(item)
      @complectation = Complectation.find_or_create_by!(item.merge!(modification_id: @modification.id))
    end

    def persist_car(item)
      params = {
        mark_id: @mark.id,
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
