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

  def self.no_results
      # Alice put here lat and lon from IP location
     #For NY 40.748817, and the longitude is -73.985428
    events=Event.new("40.748817","-73.985428", "You are here", "Specify City, State", "Check that location has right spelling", "Try it now!")
    self.map_markers(events)
  end
end
