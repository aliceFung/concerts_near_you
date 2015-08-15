class ProfilesController < ApplicationController

  def show
    @profile = current_user.profile
    @favorites = current_user.favorites
    @favorite = Favorite.new
    @locations = current_user.locations
    @location = Location.new
    @events = Bands.new('Madonna','New York').events
    @hash = MapList.map_markers(@events)
  end

  def update
    @profile = current_user.profile
    current_user.email = params[:profile][:email]
    if @profile.update(whitelisted_user_params) && current_user.save
      flash[:success] = "Successfully updated your profile"
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:failure] = "Failed to update your profile"
      redirect_to profile_path(current_user.profile.id)
    end
  end

  private

  def whitelisted_user_params
    params.require(:profile).permit(:id, :email, :frequency)
  end
end
