# == Schema Information
#
# Table name: athletes
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  graduating_class :integer
#  gender           :string(255)
#  url              :string(255)
#

class Athlete < ActiveRecord::Base
  attr_accessible :name, :graduating_class, :gender, :url
  
  validates :name, :class, :gender, presence: true
  validates :gender, inclusion: { in: "m f" }
  
  has_many :marks, inverse_of: :athlete, dependent: :destroy
  
  FIELD_EVENTS = [
    "High Jump",
    "Long Jump",
    "Triple Jump",
    "Pole Vault",
    "Hammer Throw",
    "Weight Throw",
    "Discus Throw",
    "Shot Put",
    "Javelin",
    "Discus Throw"
  ]
  
  MULTI_EVENTS = [
    "Heptathlon",
    "Indoor Pentathlon",
    "IPent",
    "Pentathlon",
    "Decathlon"
  ]
  
  # Returns a hash in the format:
  # { event_1 => { "Indoor" => [], "Outdoor" => [] },
  #   event_2 => { "Indoor" => [], "Outdoor" => [] }, etc. }
  def marks_by_event
    marks_hash = self.marks.group_by { |mark| mark.event_name }
    marks_hash.each do |event_name, mark|
      marks_hash[event_name] = marks_hash[event_name].group_by { |mark| mark.season }
    end
    
    marks_hash
  end
  
  def url_code
    return nil if self.url.nil?
    /athletes\/(.......)\.html/.match(self.url).captures.first if self.url.include?("tfrrs")
  end
  
  
  # def set_url(code)
 #    if self.url.include?("athletes/.html")
 #      puts code
 #      self.url = self.url.gsub(".html", "#{code.to_s}.html")
 #      self.save!
 #    end
 #  end
 #  
 #  def switch_url_to_tfrrs
 #    if self.url.include?("direct")
 #      puts self.name, self.id
 #      self.url = "http://www.tfrrs.org/athletes/#{self.url_code}.html"
 #      self.save!
 #    end
 #  end
  
  
  def has_data?
    !!self.url || Mark.where("athlete_id = ?", self.id).count > 0
  end
  
  def self.males
    where(gender: "m")
  end
  
  def self.females
    where(gender: "f")
  end
  
end