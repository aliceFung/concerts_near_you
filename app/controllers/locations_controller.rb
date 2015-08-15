class LocationsController < ApplicationController

  def create
    @location = current_user.locations.build(location_params)

    if @location.save
      flash[:success] = "New location created"
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:error] = "Location wasn't saved. :("
      redirect_to profile_path(current_user.profile.id)
    end
  end


  def destroy
    @location = current_user.locations.find(params[:id])
    if current_user.id == @location.user_id && @location.destroy
      flash[:success] = "Location deleted"
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:error] = "Location not updated. :("
      redirect_to profile_path(current_user.profile.id)
    end
  end

  ## REMOVE THESE WHEN WE'RE SURE WE DON'T NEED IT ANYMORE

  # def new
  #   @location = current_user.locations.build
  # end

  # def index
  #   @locations = Location.all
  # end

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
