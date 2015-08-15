class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  #=================== associations ======================

  has_many :locations
  has_one :profile
  has_many :favorites
  has_many :artists, through: :favorites

  #=================== methods ======================

  def user_interest_events
    events = []
    if current_user.locations.any? && current_user.artists.any?
      current_user.locations.each do |location|

        current_user.artists.each do |artist|
          #Need to add events from Last too
         events += Bands.new(artist, location).events
        end

      end
    end
    events
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

    if user.present?
        user
    else
        user = User.create(
                                             uid:auth.uid,
                                             email:auth.info.email,
                                             password:Devise.friendly_token[0,20])
    end
    end
  end



end
