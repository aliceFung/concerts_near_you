class PagesController < ApplicationController

 
  def index
    if current_user
      @events = MapList.user_interest_events
    else
      @origin = params[:address]
      @origin ||= address_from_ip
      #First option 
      @events = Bands.new(params[:artist], @origin).events
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
