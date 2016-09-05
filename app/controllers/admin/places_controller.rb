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

  def edit
  end

  def update
    if @place.update_attributes place_params
      flash[:success] = flash_message "updated"
      redirect_to :back
    else
      flash[:danger] = flash_message "not_updated"
      render :edit
    end
  end

  private
  def place_params
    params.require(:place).permit :name, :address, :longitude, :latitude,
      :description
  end
end
