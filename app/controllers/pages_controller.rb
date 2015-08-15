class PagesController < ApplicationController

 
  def index
     @client_ip = remote_ip
    if current_user
      #Need to be refactored into Event model
      #@events = MapList.user_interest_events

    else
      #Alice please redo to default location or location by IP if no params
      params[:address].nil? ? @origin = 'New York' : @origin = params[:address]
      @origin ||= address_from_ip
      #First option

      params[:artist].nil? ? artist = 'Madonna' : artist = params[:artist]
      @events = Bands.new(artist, @origin).events
      #Second option @events = Last.new('New York').events

      @hash = Gmaps4rails.build_markers(@events) do |event, marker|
        marker.lat  event.lat
        marker.lng  event.lon 
        marker.infowindow event.artist + '<br>' + 
                          'Where: ' + event.venue + '<br>' +
                          'What: ' + event.description + '<br>' + 
                          'When: ' + event.datetime
      end
    end
  end


  private

  def address_from_ip
    if request.location && request.location.address != "Reserved"
        return request.location.address
    end
  end


end
