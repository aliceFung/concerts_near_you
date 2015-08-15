class ProfilesController < ApplicationController

  def index
    #Should keep all events, now just one
    @events = Bands.new('Madonna','New York').all

    #Should get a location here with latitude and longitude
    # latitude=40.748817
    # longitude=-73.985428
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat  event["venue"]["latitude"] #event.latitude
      marker.lng  event["venue"]["longitude"] #event.longitude
      marker.infowindow event["artists"][0]["name"] + " ---> " + event["venue"]["name"]+ '<br>' + event["description"] +'<br>'+ event["formatted_datetime"]
    end
  end
end
