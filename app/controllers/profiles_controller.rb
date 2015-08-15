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
    if @profile.update(whitelisted_user_params)
      flash[:success] = "Successfully updated your profile"
      redirect_to user_profile_path(current_user)
    else
      flash.now[:failure] = "Failed to update your profile"
      render :edit
    end
  end


end
