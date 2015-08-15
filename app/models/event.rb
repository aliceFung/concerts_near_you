class Event

  attr_reader :lat, :lon, :artist, :description, :venue, :datetime

  def initialize(lat,lon, artist, description, venue, datetime)
    @lat = lat
    @lon = lon
    artist.is_a?(Array) ? @artist = artist.join(", ") : @artist = artist
    @description = description
    @venue = venue
    @datetime = datetime
  end

  def grab_events(artist, location, geoip)
    #Validation of input

    #Grab from Bands
      @events_bands = Bands.new(artist,location).events
    #Grad from Last
      @events_last = Last.new(artist).events
    #Combine in one list of unique events
    #Need to solve problem with several events in the same place, they need one description in one place on map


  end
end