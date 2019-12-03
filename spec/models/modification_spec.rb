# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Modification, type: :model do
  it 'creates entity' do
    expect(create(described_class.table_name.singularize)).to be_valid
  end

  it 'saves correct way' do
    model = create(:model)
    modification = model.modifications.create(name: "1.4 MT (150 л.с.)", body_type: "Универсал 5 дв.")

    expect(modification.engine_hp).to eq(150)
    expect(modification.engine_volume).to eq(1.4)
    expect(modification.doors_count).to eq(5)
  end
end
