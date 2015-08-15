class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #=================== associations ======================

  has_many :locations
  has_many :favorites
  has_many :artists, through: :favorites

  #=================== methods ======================

  def user_interest_events
    events = []
    if current_user.locations.any? && current_user.artists.any?
      current_user.locations.each do |location|

        current_user.artists.each do |artist|
         events += BandEvent.new(artist, location).all
        end

      end
    end
    events
  end

end
