require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'Jhon Doe', email: 'jhon@example.com', password: 'password')
    @group = Group.create(name: 'Category', icon: 'https://google.com', user_id: @user.id)

    sign_in @user
  end

  it 'Page should have (Add a Category) link' do
    visit user_groups_path(@user)

    expect(page).to have_content('Add a Category')
  end

  scenario 'Should go to the new category page' do
    visit user_groups_path(@user)
    first(:link, 'Add a Category').click

    expect(page).to have_content('New Category')
  end

  scenario 'Should page have (Add a Category) Button' do
    visit user_groups_path(@user)
    first(:link, 'Add a Category').click

    expect(page).to have_button('Add a Category')
  end

  scenario 'Should page have (Add a Category) Button' do
    visit user_groups_path(@user)
    first(:link, @group.name).click

    expect(page).to have_content(@group.name)
  end

  scenario 'Should page have (Add a Category) Button' do
    visit user_groups_path(@user)
    first(:link, @group.name).click

    expect(page).to have_content(@group.name)
  end
end
