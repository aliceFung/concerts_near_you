class SearchesController < ApplicationController

  def index
    if request.location && request.location.address != "Reserved"
      @placeholder = request.location
    else
      @placeholder = "New York, NY"
    end
    if params[:address].present?
      ##nearbys searches w/i the mile given for geocoded Location objs
      # @locations = params[:search].nearbys(5)
      coordinates = Geocoder.coordinates(params[:address])
      @locations = Location.near(coordinates)
    else
      @locations = Location.near(@placeholder)
    end
  end

end
