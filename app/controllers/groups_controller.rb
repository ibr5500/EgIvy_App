class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if user_signed_in?
      @groups = current_user.groups
    else
      render 'users/index'
    end
  end
end
