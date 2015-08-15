class PagesController < ApplicationController


  def index
     @client_ip = remote_ip
    if current_user && current_user.info?(current_user)
      @events = current_user.user_interest_events(current_user)
    # elsif params[:address].blank? && params[:artist].blank?
    # # Mike mentioned about location specific other info
    else
      @origin = address_for_query
      @artist = params[:artist] #if nil, default set in Bands.rb
      if @artist.blank?
        #Second option
        @events = Last.new(@origin).events
      else
        #First option
        @events = Bands.new(@artist, @origin).events
      end
      @hash = MapList.map_markers(@events)
    end
  end


  private

  def locate_by_ip
    request.location
  end

  def address_from_ip
    if locate_by_ip && locate_by_ip.address != "Reserved"
        return locate_by_ip.address
    end
  end


  def first_events_for_map
    response_row = HTTParty.get("http://api.bandsintown.com/events/search.json?location=#{city_state_for_index_info}")
    response_json = JSON.parse(response_row.response.body)
    response_json.events
  end

  def address_for_query
    if params[:address].blank?
      location = address_from_ip
      location ||= 'New York'
      return location
    else
      return params[:address]
    end
  end

  #yields coordinates in format [42.700149, -74.922767]
  def coordinates(address_str)
    Geocoder.coordinates(address_str)
  end

  def city_state_for_index_info
    if address_from_ip
      city = locate_by_ip.city
      state = locate_by_ip.state
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
