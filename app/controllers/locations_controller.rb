class LocationsController < ApplicationController

  def create
    @location = current_user.locations.build(location_params)
    lkjewrwr
    if @location.save
      flash[:success] = "New location created"
      redirect_to locations_path
    else
      flash[:error] = "Location wasn't saved. :("
      render :new
    end
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

  ## REMOVE THESE WHEN WE'RE SURE WE DON'T NEED IT ANYMORE

  def new
    @location = current_user.locations.build
  end

  def index
    @locations = Location.all
  end

  # def show
  #   if params[:location].present?
  #     @locations = Location.near(params[:location], 25, :order => :distance)
  #   else
  #     @locations = Location.all
  #   end
  # end

  # def edit
  #   @location = current_user.locations.find(params[:id])
  # end

  private

  def location_params
    params.require(:location).permit(:id, :address, :latitude, :logitude)
  end

end