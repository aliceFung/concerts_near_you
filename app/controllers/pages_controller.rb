class PagesController < ApplicationController


  def index
     @client_ip = remote_ip
    if current_user
      @events = current_user.user_interest_events
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

  def address_from_ip
    if request.location && request.location.address != "Reserved"
        return request.location.address
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

  def city_state_for_index_info
    if address_from_ip
      city = request.location.city
      state = request.location.state
      return "#{city},#{state}"
    else
      return "Boston,MA"
    end
  end


end
