class EntitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @entities = Entity.all
  end

  def new
    @group = Group.includes(:user).find(params[:group_id])
    @entity = @group.entities.new
  end

  def destroy
    @group = Group.includes(:user).find(params[:group_id])
    @entity = Entity.includes(:user).find(params[:id])
    @entity.destroy
    flash[:success] = "You have deleted your '#{@entity.name}' !!."
    redirect_to user_group_path(user_id: current_user.id, id: @group.id)
  end

  def create
    @group = Group.includes(:user).find(params[:group_id])
    @entity = current_user.entities.create(entity_params)
    @group.entities << @entity

    if @entity.save
      flash[:success] = "'#{@entity.name}' created successfully !!"
      redirect_to user_group_path(user_id: current_user.id, id: @group.id)
    else
      flash.now[:error] = "Couldn't create '#{@entity.name} !!'"
      redirect_to new_user_group_entity(current_user, @group.id)
    end
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
