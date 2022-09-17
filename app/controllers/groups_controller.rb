class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @groups = current_user.groups.includes(:user)
  end

  def show
    @group = Group.includes(:user).find(params[:id])
    @group_entities = @group.entities.all
  end

  def new
    @group = current_user.groups.new
  end

  def destroy
    @group = Group.includes(:user).find(params[:id])
    @group.destroy
    flash[:success] = "You have deleted your '#{@group.name}' !!."
    redirect_to user_groups_path(user_id: current_user.id)
  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      flash[:success] = "'#{@group.name}' created successfully !!"
      redirect_to user_groups_path(user_id: current_user.id)
    else
      flash.now[:error] = "Couldn't create '#{@group.name} !!'"
      redirect_to new_user_group_path(current_user)
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
