class PagesController < ApplicationController

  def index
    if params[:address].present? || address_from_ip
      coordinates = Geocoder.coordinates(params[:address])
      @locations = Location.near(coordinates)
    else
      @locations = Location.near(@placeholder)
    end

    @events = BandEvent.new('Madonna','New York').all

    #Should get a location here with latitude and longitude
    # latitude=40.748817
    # longitude=-73.985428
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat  event["venue"]["latitude"] #event.latitude
      marker.lng  event["venue"]["longitude"] #event.longitude
      marker.infowindow event["artists"][0]["name"] + " ---> " + event["venue"]["name"]+ '<br>' + event["description"] +'<br>'+ event["formatted_datetime"]
    end
  end

  def create
    #grab a query from search form,
    # => if no location given grab geo location, if not found set default New York
    # => if no name specified give a 'Madonna' name for now we can't grab all events for a location
    #if no events found show "No event for this artist in this area are known"
    #put query into params for obj Bands see line 5
    #redirect_to root
  end

  private

  def address_from_ip
    if request.location && request.location.address != "Reserved"
        @placeholder = request.location
    end
  end


end
