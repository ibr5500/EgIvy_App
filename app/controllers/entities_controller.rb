class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
  end

  def show; end
end
