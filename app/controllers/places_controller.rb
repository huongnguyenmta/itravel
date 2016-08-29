class PlacesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  private
  def place_params
    params.require(:place).permit :name, :longitude, :latitude,
      :description, :town_id
  end
end
