class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :build_profile, :if => Proc.new{ self.profile.nil? }
  #=================== associations ======================

  has_many :locations
  has_one :profile
  has_many :favorites
  has_many :artists, through: :favorites
  has_one :news_time

  #=================== methods ======================

  def user_interest_events(current_user)
    events = []
    if info?(current_user)
      current_user.locations.each do |location|

        current_user.artists.each do |artist|
          #Need to add events from Last too
         events += Bands.new(artist.name, location.address).events
        end

      end
    end
    events
  end

  def info?(user)
    user.locations.any? && user.artists.any?
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
