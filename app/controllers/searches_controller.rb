class SearchesController < ApplicationController

  def index
    if request.location && request.location.address != "Reserved"
      @location = request.location
    else
      @location = "New York, NY"
    end
    @matches = params
  end

end
