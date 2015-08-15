class SearchesController < ApplicationController

  def show
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

  private

  def locate_by_ip
    request.location
  end

  def address_from_ip
    if locate_by_ip && locate_by_ip.address != "Reserved"
        return locate_by_ip.address
    end
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

end
