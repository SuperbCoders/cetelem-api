# frozen_string_literal: true

class DealerCar < ApplicationRecord
  COLORS = %w[Бежевый Белый Голубой Желтый Зеленый Золотой Коричневый Красный Оранжевый Пурпурный
    Розовый Серебряный Серый Синий Фиолетовый Черный].freeze()
  WHEELS = %w[Левый Правый].freeze()
  ENGINE_TYPES = %w[ Бензин Дизель Гибрид Электро ГБО Водородный.].freeze()

  belongs_to :car
  belongs_to :dealer
  has_many :images, dependent: :destroy
  has_one :reservation, dependent: :destroy
  has_many :dealer_car_extra_options, dependent: :destroy
  has_many :extra_options, through: :dealer_car_extra_options

  accepts_nested_attributes_for :images

  before_destroy do
    dealer_car_extra_options.delete_all
  end

  # validates :price, numericality: true
  # validates :currency, inclusion: { in: %w[rub] }
  # validates :color, :availability, :owners_number,
  #           :registry_year, :vin, presence: true
  # validates :custom, inclusion: { in: [true, false, 'true', 'false'] }
  # validates :metallic, inclusion: { in: [true, false, 'true', 'false'] }

  scope :available, -> { left_joins(:reservation).where('reservations.id' => nil) }
end
