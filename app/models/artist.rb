class Artist < ActiveRecord::Base

  #===================== associations ================
  has_many :favorites

  has_many :fans, through: :favorites, source: :user

  #===================== methods ===================

  def self.name_to_id(name)
    result = self.where("name = ?", name).first
    if result.nil?
      result = Artist.create(name: name)
      result.save
    end
    result.id
  end

end
