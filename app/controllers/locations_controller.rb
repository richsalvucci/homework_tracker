class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_location, only: [:show, :edit, :update, :destroy]

  def index
    # authorize! :read, Location
    @locations = Location.all
  end

  def new
    # authorize! :create, Location
    @location = Location.new
  end

  def create
    # authorize! :create, Location
    @location = Location.create location_params
    if @location.save
      flash[:notice] = "Thank You"
     redirect_to root_path
    else
      flash[:error] = "Please name your location."
      render :new
    end
  end

  def show
    # authorize! :read, Location
  end

  def edit
    # authorize! :update, Location
  end

  def update
    # authorize! :update, Location
    @location.update_attributes location_params
    redirect_to root_path
  end

  def destroy
    # authorize! :destroy, Location
    @location.delete
    redirect_to root_path
  end
private
  
  def find_location
    @location = Location.find params[:id]
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
