require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  include Devise::Test::IntegrationHelpers
  # before(:all) do
  #  @user = User.create(name: 'Tester', email: 'test@gmail.com', password: '12345678')
  # end

  # it 'Page sholud have Add a Category' do
  #  visit '/users/sign_in'
  #  expect(page).to have_content('Log in')
  # end

  before(:each) do
    @user = User.create(name: 'Ali Raza', email: 'hello@example.com', password: 'password')
    @group = Group.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: @user.id)

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

  scenario 'Should page have (Add a Transaction) Link' do
    visit user_groups_path(@user)
    first(:link, @group.name).click

    expect(page).to have_content('Add a Transaction')
  end

  it 'Should page have (Remove) Button' do
    visit user_groups_path(@user)
    first(:link, @group.name).click

    expect(page).to have_content('Total:')
  end
end
