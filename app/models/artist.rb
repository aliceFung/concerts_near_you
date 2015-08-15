class Artist < ActiveRecord::Base

  has_many :favorites

  has_many :fans, through: :favorites, source: :user

end
