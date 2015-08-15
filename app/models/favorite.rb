class Favorite < ActiveRecord::Base

  #===================== associations ================

  belongs_to :artist
  belongs_to :user

  #===================== callbacks ===================
  # before_create :check_artist #, :if => Proc.new{ self.artist.nil? }

  #===================== methods ===================

  #virtual attribute writer
  def artist_name=(artist_name)
    self.artist = Artist.name_to_id unless artist_name.nil?
  end

  #virtual attribute reader
  def artist_name
    self.artist.name
  end

  def check_artist(params[:artist_name])
    if params[:artist_name]
      return Artist.name_to_id(params[:artist_name])
    end
  end

end
