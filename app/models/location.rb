class Location < ActiveRecord::Base

  belongs_to :user

  geocoded_by :address

  #changed from after_validation b/c of lat&long. validations
  before_validation :geocode, :if => :address_changed?

  #============== validations ===============

  validates :address, :presence => true

  validates_numericality_of :latitude, only_integer: false,
                            greater_than_or_equal_to: -90.0,
                            less_than_or_equal_to: 90.0#,
                            #allow_nil: true

  validates_numericality_of :longitude, only_integer: false,
                            greater_than_or_equal_to: -180.0,
                            less_than_or_equal_to: 180.0#,
                            #allow_nil: true

  #============== methods ===============

  # def all_artist_events
  #   list=[]
  #   current_user.artists.each do |artist|
  #     list += BandEvent.new(artist, self.address).all
  #   end
  # end


end
