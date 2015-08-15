class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(params_list)

    if favorite.save
      flash[:success] = "New music favorite added to your list."
      redirect to user_path(current_user)
    else
      flash[:error] = "Save failed. :("
      redirect to user_path(current_user)
    end
  end


  def destroy
    favorite = current_user.favorites.find(params[:id])
    if current_user.id == favorite.user_id && favorite.destroy
      flash[:success] = "Deleted from your list"
      redirect to user_path(current_user)
    else
      flash[:error] = "It was not deleted. :("
      redirect to user_path(current_user)
    end
  end

  private

  def params_list
    params.require(:favorite).permit(:id, :artist_name, :artist_id)
    params[:artist_name].downcase.strip!
  end



end
