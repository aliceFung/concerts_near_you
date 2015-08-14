class Location < ActiveRecord::Base

  belongs_to :user

  geocoded_by :address

  #changed from after_validation b/c of lat&long. validations
  before_validation :geocode, :if => :address_changed?

  #============== validations ===============

  validates :address, :presence => true

  ## technically latitude is -90 to 90, but based on api/gem range
  validates_numericality_of :latitude, only_integer: false,
                            greater_than_or_equal_to: -90.0,
                            less_than_or_equal_to: 90.0#,
                            #allow_nil: true

  ## technically longitude is -180 to 180, but based on api/gem range
  validates_numericality_of :longitude, only_integer: false,
                            greater_than_or_equal_to: -180.0,
                            less_than_or_equal_to: 180.0#,
                            #allow_nil: true

  #============== methods ===============


end
