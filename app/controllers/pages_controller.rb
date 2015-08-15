class PagesController < ApplicationController

  def index
    if current_user
      @events = MapList.user_interest_events
    else
      @origin = params[:address]
      @origin ||= address_from_ip
      @events = BandEvent.new(params[:artist], @origin).all
      @hash = MapList.map_markers(@events)
      # @hash = MapList.no_event_location(params[:address]) if @events.empty?
    end
  end

  # don't need this. just redirect to index with get request again
  # def create
  #   #grab a query from search form,
  #   # => if no location given grab geo location, if not found set default New York
  #   # => if no name specified give a 'Madonna' name for now we can't grab all events for a location
  #   #if no events found show "No event for this artist in this area are known"
  #   #put query into params for obj Bands see line 5
  #   #redirect_to root
  # end

  private

  def address_from_ip
    if request.location && request.location.address != "Reserved"
        return request.location.address
    end
  end


end
