class DealerCarSerializer < ActiveModel::Serializer
  attributes *DealerCar.column_names


  belongs_to :car, serializer: CarSerializer
  has_many :images, serializer: ImageSerializer
  has_one :reservation, serializer: ReservationSerializer
  has_many :extra_options, serializer: ExtraOptionSerializer
end
