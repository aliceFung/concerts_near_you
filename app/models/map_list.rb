class MapList

  #just makes markers for map
  def self.map_markers(events)

    m_markers = Gmaps4rails.build_markers(events) do |event, marker|
      #event.latitude
      marker.lat  event["venue"]["latitude"]

      #event.longitude
      marker.lng  event["venue"]["longitude"]

      marker.infowindow event["artists"][0]["name"] + " ---> " +
       event["venue"]["name"]+ '<br>' + event["description"] +
       '<br>'+ event["formatted_datetime"]
    end
  end

end
