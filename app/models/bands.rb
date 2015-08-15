
class Bands
  attr_reader :response_json


  def initialize(name, location)
    @name = artist_default(name)
    @location=location
    response_row = HTTParty.get("http://api.bandsintown.com/artists/#{name}/events/search.json?api_version=2.0&app_id=YOUR_APP_ID&location=#{location}&radius=10")

    @response_json = JSON.parse(response_row.response.body)

  end

  def events
    events = []
    self.response_json.each do |event|
      break if event[0] == "errors"
      lat = event["venue"]["latitude"]
      lon = event["venue"]["longitude"]
      artist = event["artists"][0]["name"]
      venue = event["venue"]["name"]
      description = event["description"]
      datetime = event["formatted_datetime"]

      events << Event.new(lat,lon,artist,description,venue,datetime)
    end
    events
  end

  def artist_default(input)
    if input.nil?
      return 'Madonna'
    else
      return input
    end
  end


end

