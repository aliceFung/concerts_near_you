class LocationsController < ApplicationController

  def index
    #by location by IP address, default NYC
    # if request.location
    #   @location = request.location
    # else
    #   @location = "New York, NY"
    # end
    @locations = Location.all
  end

  def new
    @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      flash[:success] = "New location created"
      redirect_to locations_path
    else
      flash[:error] = "Location wasn't saved. :("
      render :new
    end
  end

  def edit
    @location = current_user.locations.find(params[:id])
  end

  def update
    @location = current_user.locations.find(params[:id])
    if current_user.id == @location.user_id && @location.save
      flash[:success] = "Location updated"
      redirect to user_path(current_user)
    else
      flash[:error] = "Location not updated. :("
      render :edit
    end
  end


  def show
    if params[:location].present?
      @locations = Location.near(params[:location], 25, :order => :distance)
    else
      @locations = Location.all
    end
  end

  private

  def location_params
    params.require(:location).permit(:id, :address, :latitude, :logitude)
  end

end
