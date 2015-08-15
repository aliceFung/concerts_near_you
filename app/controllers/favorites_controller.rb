class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(params_list)

    if favorite.save
      flash[:success] = "New music favorite added to your list."
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:error] = "Save failed. :("
      redirect_to profile_path(current_user.profile.id)
    end
  end


  def destroy
    favorite = current_user.favorites.find(params[:id])
    if current_user.id == favorite.user_id && favorite.destroy
      flash[:success] = "Deleted from your list"
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:error] = "It was not deleted. :("
      redirect_to profile_path(current_user.profile.id)
    end
  end

  private

  def params_list
    params.require(:favorite).permit(:id, :artist_name, :artist_id)
    params[:favorite][:artist_name].downcase.strip!
  end



end
