class Bands
  attr_accessor :response

  # base_uri "http://api.bandsintown.com/artists"
  # Bandsintown.app_id = 'Practice_with_API'

  attr_accessor :name, :info

  def initialize(name, location)
    #@options = { :query => { :name => name} }
    #For artist by name search 
    #response_row = HTTParty.get("http://api.bandsintown.com/artists/#{name}.json?api_version=2.0&app_id=practice")

    response_row = HTTParty.get("http://api.bandsintown.com/artists/#{name}/events/search.json?api_version=2.0&app_id=YOUR_APP_ID&location=#{location}&radius=10")
    #Make a hash from string
    @response = JSON.parse(response_row.response.body)

  end


  def artist
    @response[0]["artists"].first["name"]
  end

  def thumb
    @response[0]["artists"].first["thumb_url"]
  end

  def title
    @response[0]["title"]
  end

  def datetime
    @response[0]["formatted_datetime"]
  end

  def description
    @response[0]["description"]
  end
  


end

