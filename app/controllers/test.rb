class Test
  attr_reader :response_json
  def initialize(location)

    #Request
    response_row = HTTParty.get("http://api.bandsintown.com/events/search.json?location=#{location}")
    #Response
    @response_json = JSON.parse(response_row.response.body)

  end
  
  def events
    events = []
    self.response_json.each do |event|
      lat = event["venue"]["latitude"]
      lon = event["venue"]["longitude"]
      if event["artists"].size == 1
        artist = event["artists"].first["name"]
      else
        artist=[]
        event["artists"].each{|art| artist<<art["name"]}
      end
      venue = event["venue"]["name"]
      description = "Concert"
      datetime = event["datetime"]

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