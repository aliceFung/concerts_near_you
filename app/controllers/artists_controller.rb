class ArtistsController < ApplicationController

  def create
    artist = current_user.artists.build(location_params)

    if artist.save
      flash[:success] = "New music artist added to your list."
      redirect to user_path(current_user)
    else
      flash[:error] = "Save failed. :("
      redirect to user_path(current_user)
    end
  end


  def destroy
    artist = current_user.artists.find(params[:id])
    if current_user.id == artist.user_id && artist.destroy
      flash[:success] = "Music artist deleted from your list"
      redirect to user_path(current_user)
    else
      flash[:error] = "It was not deleted. :("
      redirect to user_path(current_user)
    end
  end

end

