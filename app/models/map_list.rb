class MapList


  def self.map_markers(events)
    Gmaps4rails.build_markers(events) do |event, marker|
        marker.lat  event.lat
        marker.lng  event.lon
        marker.infowindow event.artist + '<br>' +
                          'Where: ' + event.venue + '<br>' +
                          'What: ' + event.description + '<br>' +
                          'When: ' + event.datetime
    end
  end

  def no_results
    # Alice put here lat and lon from IP location
    
    #events=Event.new(lat,lon, "You are here", "No events were found for this location", "Try to add an artist", "Thank you")
    self.map_markers(events)
  end
end
