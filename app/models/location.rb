class Location < ActiveRecord::Base

  belongs_to :user
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  #============== validations ===============

  validates :address, :latitude, :longitude, :prescence => true

  # technically latitude is -90 to 90, but based on api/gem range
  validates :latitude, numericality: { greater_than_or_equal_to: 0,
                                      less_than_or_equal_to: 180,
                            message: "Must be between 0 and 180" }

  # technically longitude is -180 to 180, but based on api/gem range
  validates :latitude, numericality: { greater_than_or_equal_to: 0,
                                      less_than_or_equal_to: 180,
                            message: "Must be between 0 and 360" }

  #============== methods ===============


end
