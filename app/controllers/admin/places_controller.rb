class Admin::PlacesController < Admin::BaseController
  load_and_authorize_resource

  def new
  end

  def create
    if @place.save
      flash[:success] = flash_message "created"
      redirect_to admin_places_url
    else
      flash[:danger] = flash_message "not_created"
      render :new
    end
  end

  private
  def place_params
    params.require(:place).permit :name, :address, :longitude, :latitude,
      :description
  end
end
