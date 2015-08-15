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

  def first_events_for_map
    response_row = HTTParty.get("http://api.bandsintown.com/events/search.json?location=#{city_state_for_index_info}")
    response_json = JSON.parse(response_row.response.body)
    response_json.events
  end

  def city_state_for_index_info
    if address_from_ip
      city = request.location.city
      state = request.location.state
      return "#{city},#{state}"
    else
      return "Boston,MA"
    end
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

end
