class Favorite < ActiveRecord::Base

  #===================== associations ================

  belongs_to :artist
  belongs_to :user

  #===================== callbacks ===================
  before_create :create_artist #, :if => Proc.new{ self.profile.nil? }

  #===================== methods ===================

  def picture_from_url(url)
    begin
      self.picture = open(url)
    rescue
      return flash = {:error => "Problems with that link"}
    end
  end

  #virtual attribute writer
  def photo_link=(photo_link)
    self.picture_from_url(photo_link) unless photo_link.nil?
  end

  #virtual attribute reader (to keep form_for from complaining)
  def artist_name
    self.artist_id.name
  end

end
