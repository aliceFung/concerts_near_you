class ProfilesController < ApplicationController

  def index

    @events = Bands.new('Madonna','New York').events

    @hash = MapList.map_markers(@events)

  end

  # def index

  # end
end
