class BandEvent
  attr_accessor :response

  # base_uri "http://api.bandsintown.com/artists"
  # Bandsintown.app_id = 'Practice_with_API'

  attr_accessor :name, :location

  def initialize(name , location)
    name ||= "Madonna"
    location ||= "New York"
    #@options = { :query => { :name => name} }
    #For artist by name search
    #response_row = HTTParty.get("http://api.bandsintown.com/artists/#{name}.json?api_version=2.0&app_id=practice")

    response_row = HTTParty.get("http://api.bandsintown.com/artists/#{name}/events/search.json?api_version=2.0&app_id=YOUR_APP_ID&location=#{location}&radius=10")
    #Make a hash from string
    @response_json = JSON.parse(response_row.response.body)

  end

  def all
    arr = []
    @response_json.size.times do |i|
      arr << @response_json[i]
    end
    arr
  end

  def artist
    self["artists"][0]["name"]
  end

  def thumb
    self["artists"][0]["thumb_url"]
  end

  def title
    self["title"]
  end

  def datetime
    self["formatted_datetime"]
  end

  def description
    @response[0]["description"]
  end



end

