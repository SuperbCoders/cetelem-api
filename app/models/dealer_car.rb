# frozen_string_literal: true

require_relative 'concerns/queryable'

class DealerCar < ApplicationRecord
  include Queryable
  include Rails.application.routes.url_helpers

  COLORS = %w[Бежевый Белый Голубой Желтый Зеленый Золотой Коричневый Красный Оранжевый Пурпурный
              Розовый Серебряный Серый Синий Фиолетовый Черный].freeze
  WHEELS = %w[Левый Правый].freeze
  ENGINE_TYPES = %w[Бензин Дизель Гибрид Электро ГБО Водородный.].freeze
  STATES = ['Отличное', 'Хорошее', 'Среднее', 'Требует ремонта'].freeze
  OWNERS_NUMBER = ['Один владелец', 'Два владельца', 'Три и более'].freeze

  belongs_to :car
  belongs_to :owner, polymorphic: true

  has_many_attached :xmls
  has_one :reservation
  has_many :dealer_car_extra_options, dependent: :destroy
  has_many :extra_options, through: :dealer_car_extra_options

  has_many_attached :images

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

  def dealer_id
    owner_id if owner_type == "Dealer"
  end

  def dealer_group_id
    owner_id if owner_type == "DealerGroup"
  end

  def dealer_id=(val)
    self.owner_id = val
    self.owner_type = "Dealer"
  end

  def dealer_group_id=(val)
    self.owner_id = val
    self.owner_type = "DealerGroup"
  end

  def full
    attributes.merge(
      mark: car.mark.name,
      model: car.model.name,
      complectation: car.complectation.name,
      modification: car.modification.name,
      engine_type: car.modification.engine_type,
      engine_hp: car.modification.engine_hp,
      engine_volume: car.modification.engine_volume,
      doors_count: car.modification.doors_count,
      body_type: car.modification.body_type,
      years: car.modification.years,
      owner_id: owner_id,
      owner_type: owner_type,
      dealer_name: owner.name,
      delaer_id: dealer_id,
      dealer_group_id: dealer_group_id,
      extra_options: extra_options.as_json(only: %i[name type]),
      images: images.map { |i| rails_blob_path(i, only_path: true) }
    )
  end
end
