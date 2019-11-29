# frozen_string_literal: true

class Modification < ApplicationRecord
  belongs_to :model
  has_many :complectations

  # BODY_TYPES = ['Кабриолет', 'Компактвэн', 'Купе', 'Купе-хардтоп', 'Фастбек',
  #               'Фургон', 'Хэтчбек', 'Ландо', 'Лифтбек', 'Лимузин', 'Микровэн', 'Минивэн',
  #               'Внедорожник', 'Фаэтон-универсал', 'Пикап', 'Родстер', 'Седан', 'Тарга',
  #               'Седан-хардтоп', 'Спидстер', 'Внедорожник открытый', 'Универсал', 'Фаэтон'].freeze

  # validates :engine_type, inclusion: { in: %i[gasolene disel hybrid] }
  # validates :drive, inclusion: { in: %i[4wd awd fwd] }
  # validates :gearbox, inclusion: { in: %i[robot automat manual] }
  # validates :body_type, inclusion: { in: BODY_TYPES }

  before_save do |modification|
    modification.engine_power ||=  modification.name[/\(.* л\.с\.\)/, 0]&.gsub(/[()]/, "")
  end
end
