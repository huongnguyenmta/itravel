class Admin::BusinessTypesController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @business_type.save
      redirect_to admin_business_types_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @business_type.update_attributes business_type_params
      redirect_to admin_business_types_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @business_type.destroy
    else
    end
    redirect_to admin_business_types_path
  end

  private
  def business_type_params
    params.require(:business_type).permit :name
  end
end
