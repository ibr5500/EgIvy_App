require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'Tester', email: 'test@example.com', password: '123456')
    @group = Group.create(name: 'Category', icon: 'http://google.com', user_id: @user.id)
    @entity = Entity.create(name: '')

    sign_in @user
  end

  # it 'Page should have (Add a Category) link' do
  #  visit user_groups_path(@user)

  #  expect(page).to have_content('Add a Category')
  # end

  # scenario 'Should go to the new category page' do
  #  visit user_groups_path(@user)
  #  first(:link, 'Add a Category').click

  #  expect(page).to have_content('New Category')
  # end

  # scenario 'Should page have (Add a Category) Button' do
  #  visit user_groups_path(@user)
  #  first(:link, 'Add a Category').click

  #  expect(page).to have_button('Add a Category')
  # end

  # scenario 'Should page have (Add a Transaction) Link' do
  #  visit user_groups_path(@user)
  #  first(:link, @group.name).click

  #  expect(page).to have_content('Add a Transaction')
  # end

  # it 'Should page have (Remove) Button' do
  #  visit user_groups_path(@user)
  #  first(:link, @group.name).click

  #  expect(page).to have_content('Total:')
  # end
end
