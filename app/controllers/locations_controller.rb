class LocationsController < ApplicationController

  def index
    @locations = current_user.locations
    # if params[:search].present?
    #   @locations = Location.near(params[:search], 25, :order => :distance)
    # else
    #   @locations = Location.all
    # end
  end

  def new
    @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      flash[:success] = "New location created"
      redirect to user_path(current_user)
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
    if request.location
      @location_placeholder = request.location
    else
      @location_placeholder = "New York, NY"
    end
  end

  def destroy

  end

  private

  def location_params
    params.require(:location).permit(:id, :address, :latitude, :logitude)
  end

end
