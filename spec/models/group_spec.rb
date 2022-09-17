require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.first
    @group = Group.new(user: @user, name: 'Category 1', icon: 'http://google.com')
    @entity = Entity.new(user: @user, name: 'transaction 1', amount: 10)
  end

  it 'Name should not be blank' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'Icon should not be blank' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end

  it 'Test for join table (entity_group)' do
    @group.entities << @entity
    expect(@group.entities.first.amount).to eq(@entity.amount)
  end
end
