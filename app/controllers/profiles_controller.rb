class ProfilesController < ApplicationController

  def index
    #Should keep all events, now just one
    @events = Bands.new('Madonna','New York').events
    @hash = MapList.map_markers(@events)
  end

  # def index

  # end
end
