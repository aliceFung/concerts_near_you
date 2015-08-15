class Last
  attr_reader :response_json
  def initialize(location)

    #Request
    response_row = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&api_key=1fd1c9089ad4d4f2107e8376001a87c9&format=json")
    #Response
    @response_json = JSON.parse(response_row.response.body)

  end
  
  def events
    events = []
    self.response_json["events"]["event"].each do |event|
      lat = event["venue"]["location"]["geo:point"]["geo:lat"]
      lon = event["venue"]["location"]["geo:point"]["geo:long"]
      artist = event["artists"]["artist"]
      venue = event["venue"]["name"]
      description = event["title"]
      datetime = event["startDate"]

      events << Event.new(lat,lon,artist,description,venue,datetime)
    end
    events
  end


    #Available information
      #l=Last.new('Madrid')
      #l.response_json
      #arr=r["events"]["event"].size - array of events
      #arr.each do |event| 
      #event is a hash
      #event["title"]
      #event["artists"]["artist"] - name
      #event["venue"]["name"]
      #event["venue"]["location"]["geo:point"]["geo:lat"]
      #event["venue"]["location"]["geo:point"]["geo:long"]
      #event["venue"]["city"]
      #event["venue"]["country"]
      #event["venue"]["street"]
      #event["venue"]["website"]
      #event["startDate"]


end