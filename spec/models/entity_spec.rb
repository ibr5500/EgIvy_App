require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.first
    @group = Group.new(user: @user, name: 'Category 1', icon: 'http://google.com')
    @entity = Entity.new(user: @user, name: 'transaction 1', amount: 10)
  end

  it 'Name should not be blank' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'Amount should not be blank' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end

  it 'Amount should equal or more than zero' do
    @entity.amount = -1
    expect(@entity).to_not be_valid
  end

  it 'Test for join table (entity_group)' do
    @entity.groups << @group
    expect(@entity.groups.first.name).to eq(@group.name)
  end
end
