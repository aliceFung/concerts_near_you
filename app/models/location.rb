class Location < ActiveRecord::Base

  belongs_to :user

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  #============== validations ===============

  validates :address, :presence => true

  # technically latitude is -90 to 90, but based on api/gem range
  # validates_numericality_of :latitude, greater_than_or_equal_to: -90,
  #                                     less_than_or_equal_to: 90

  # # technically longitude is -180 to 180, but based on api/gem range
  # validates_numericality_of :longitude, greater_than_or_equal_to: -180,
  #                                     less_than_or_equal_to: 180

  #============== methods ===============


end
