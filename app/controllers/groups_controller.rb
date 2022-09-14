class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if user_signed_in?
      @groups = current_user.groups.lmit
    else
      render 'users/index'
    end
  end

  def show
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      flash[:success] = "'#{@group.name}' created successfully !!"
      redirect_to user_groups_path(user: current_user)
    else
      flash.now[:error] = "Couldn't create '#{@group.name} !!'"
      render :new
    end
  end

  private

  def group_params
    params.require(:group).pirmit(:name, :icon)
  end
end
