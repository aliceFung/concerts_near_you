class PagesController < ApplicationController
  require 'page'
  require 'pp'
  def index
    #Should keep all events, now just one
    @events = Bands.new('Madonna','New York')

    #Should get a location here with latitude and longitude
    latitude=40.748817
    longitude=-73.985428
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat  latitude #event.latitude
      marker.lng  longitude #event.longitude
      marker.infowindow @events.description
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

  
end
