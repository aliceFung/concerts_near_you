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

  def self.no_results(lat, lon)
     
     #For NY 40.748817, and the longitude is -73.985428
    events=Event.new(lat,lon, "You were looking here", "Specify City, State", "Check that location has right spelling", "Try it now!")
    self.map_markers(events)
  end
end
