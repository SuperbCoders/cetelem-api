# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates entity' do
    expect(create(described_class.table_name.singularize)).to be_valid
  end

  it "doesn't allow to create same login" do
    create(:user)
    expect(build(:user)).not_to be_valid
  end

  it 'has correct authorization and authentication' do
    user = build(:user, login: 'alex', password: nil, password_confirmation: nil)

    expect(user.save).to eq(false)

    user.password = 'mUc3m00RsqyRe'
    expect(user.save).to eq(true)

    # user.password_confirmation = 'mUc3m00RsqyRe'
    # expect(user.save).to eq(true)

    expect(user.authenticate('notright')).to eq(false)
    expect(user.authenticate('mUc3m00RsqyRe')).to be_a(User)

    expect(User.find_by(login: 'alex').authenticate('notright')).to eq(false)
    expect(User.find_by(login: 'alex').authenticate('mUc3m00RsqyRe')).to be_a(User)
  end

  it 'has correct roles' do
    expect(build(:user, role: :user)).to be_valid
    expect(build(:user, role: :dealer)).to be_valid
    expect(build(:user, role: :admin)).to be_valid
  end
end
