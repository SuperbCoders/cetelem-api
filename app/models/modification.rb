# frozen_string_literal: true

class Modification < ApplicationRecord
  belongs_to :model

  has_many :cars

  BODY_TYPES = ['Кабриолет', 'Компактвэн', 'Купе', 'Купе-хардтоп', 'Фастбек',
                'Фургон', 'Хэтчбек', 'Ландо', 'Лифтбек', 'Лимузин', 'Микровэн', 'Минивэн',
                'Внедорожник', 'Фаэтон-универсал', 'Пикап', 'Родстер', 'Седан', 'Тарга',
                'Седан-хардтоп', 'Спидстер', 'Внедорожник открытый', 'Универсал', 'Фаэтон'].freeze
  DRIVE = %w[Полный Передний Задний].freeze
  ENGINE_TYPES = %w[Бензин Дизель Гибрид Электро ГБО Водородный].freeze
  GEARBOXES = ['Автоматическая', 'Механическая', 'Автомат вариатор', 'Автомат робот'].freeze

  # validates :engine_type, inclusion: { in: ENGINE_TYPES }
  # validates :drive, inclusion: { in: DRIVE }
  # validates :gearbox, inclusion: { in: GEARBOXES }
  # validates :body_type, inclusion: { in: BODY_TYPES }

  before_create do |modification|
    modification.engine_hp ||= modification.name[/\(.* л\.с\.\)/, 0]&.gsub(/[()]/, '')
    modification.engine_volume ||= modification.name[/\d\.\d/, 0]
    modification.doors_count ||= modification.body_type[/\d/, 0]
  end
end
