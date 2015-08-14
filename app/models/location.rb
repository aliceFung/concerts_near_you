class Location < ActiveRecord::Base

  belongs_to :user

  validates :latitude, :longitude,  :prescence => true
  validates :latitude, numericality: { greater_than: -90,
                                      less_than_or_equal_to: 90,
                            message: "Must be between -90 and 90" }

  validates :latitude, numericality: { greater_than: -180,
                                      less_than_or_equal_to: 180,
                            message: "Must be between -180 and 180" }

  #============== methods ===============

  def address_to_long_lat
    #
  end

end
