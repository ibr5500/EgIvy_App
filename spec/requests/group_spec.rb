require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Tester', email: 'test@gmail.com', password: '12345678')
      @group = Group.create(user: @user, name: 'Category 1', icon: 'http://google.com')

      sign_in @user
    end

    it 'groups#index - should response status success' do
      get user_groups_path(@user.id)
      expect(response).to have_http_status(:success)
    end

    it 'groups#show - should response status success' do
      get user_group_path(@user.id, @group.id)
      expect(response).to have_http_status(:success)
    end
  end
end
