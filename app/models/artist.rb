class Artist < ActiveRecord::Base

  #===================== associations ================
  has_many :favorites

  has_many :fans, through: :favorites, source: :user

  #===================== methods ===================


end
