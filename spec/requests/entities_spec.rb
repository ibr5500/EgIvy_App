require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'Entity request test' do
    before(:each) do
      @user = User.create(name: 'Tester', email: 'test@gmail.com', password: '12345678')
      @group = Group.create(user: @user, name: 'Category 1', icon: 'http://google.com')
      @entity = @group.entities.create(user: @user, name: 'transaction 1', amount: 10)

      sign_in @user
    end

    it 'groups#index - should response status success' do
      get user_group_path(@user.id, @group.id)
      expect(response).to have_http_status(:success)
    end

    it 'entity#new - should response status success' do
      get new_user_group_entity_path(@user.id, @group.id)
      expect(response).to have_http_status(:success)
    end
  end
end
