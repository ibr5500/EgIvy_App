require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'Jhon Doe', email: 'jhon@example.com', password: 'password')
    @group = Group.create(name: 'Category', icon: 'https://google.com', user_id: @user.id)
    @entity = @group.entities.create(name: 'Transaction', amount: 100, user_id: @user.id)

    sign_in @user
  end

  it 'Page should have name' do
    visit user_group_path(@user, @group)

    expect(page).to have_content(@group.name)
  end

  scenario 'Should go to the new Transaction page' do
    visit user_group_path(@user, @group)
    first(:link, 'Add a Transaction').click

    expect(page).to have_content('New Transaction')
  end

  scenario 'Should page have (Remove) Button' do
    visit user_groups_path(@user)

    expect(page).to have_button('Remove')
  end
end
