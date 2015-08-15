class Favorite < ActiveRecord::Base

  #===================== associations ================

  belongs_to :artist
  belongs_to :user

  # #===================== callbacks ===================
  # before_create :check_artist(params[:])

  validates :user_id, :artist_id, presence: true

  #===================== methods ===================

  #virtual attribute writer
  def artist_name=(artist_name)
    self.artist_id = Artist.name_to_id(artist_name) unless artist_name.nil?
  end

  #virtual attribute reader
  def artist_name
    self.artist.name
  end

  # def check_artist(input)
  #   if input
  #     Artist.name_to_id(input)
  #   end
  # end

end
