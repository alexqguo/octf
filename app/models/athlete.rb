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
  
  def self.males
    where(gender: "m")
  end
  
  def self.females
    where(gender: "f")
  end
  
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
  
  def highcharts_data
    data = {}
    self.marks_by_event.each do |key, mark_data|
      mark_hash = {}
      mark_hash["years"] = years_array(mark_data)
      # mark_
      
      data[key] = mark_hash
    end
    
    data
  end
  
  def url_code
    return nil if self.url.nil?
    /athletes\/(.......)\.html/.match(self.url).captures.first if self.url.include?("tfrrs")
  end
  
  def has_data?
    !!self.url || Mark.where("athlete_id = ?", self.id).count > 0
  end
  
  def years_array(mark_data)
    if mark_data["Indoor"] && mark_data["Outdoor"]
      min = [mark_data["Indoor"][-1].year, mark_data["Outdoor"][-1].year].min
      max = [mark_data["Indoor"][0].year, mark_data["Outdoor"][0].year].max
    else
      min = mark_data.values.first[-1].year
      max = mark_data.values.first[0].year
    end
    
    (min..max).to_a
  end
  
 #  def set_url(code)
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
  
end