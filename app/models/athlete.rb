# == Schema Information
#
# Table name: athletes
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  graduating_class :integer
#  gender           :string(255)
#  url              :string(255)
#  slug             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Athlete < ActiveRecord::Base
  include EventHelper
  include LookupHelper
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :name, :graduating_class, :gender, :url, :updated_at
  
  validates :name, :gender, presence: true
  validates :gender, inclusion: { in: "m f", allow_nil: true }
  
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
    "Discus Throw",
    "Discus"
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
  
  # Formats data to be easily used with highcharts
  # TODO: unit of measurement, other various helper things
  def highcharts_data
    data = {}
    self.marks_by_event.each do |event_name, mark_data|
      mark_hash = {}
      mark_hash["years"] = years_array(mark_data)
      mark_hash["is_running_event"] = mark_data.values.first[0].is_running_event?
      mark_hash["units"] = mark_data.values.first[0].units_of_measurement
      mark_hash["series"] = []
      
      mark_data.each do |season, season_data|
        mark_hash["series"] << {
          name: season,
          data: mark_array(mark_hash["years"], season_data),
          color: (season == "Indoor" ? "#BE0F0F" : "#EAD900")
        }
      end
      
      data[event_name] = mark_hash
    end
    
    data
  end
  
  def url_code
    return nil if self.url.nil?
    /athletes\/(.......)\.html/.match(self.url).captures.first if self.url.include?("tfrrs")
  end

  def update_url_code(url)
    self.url = "http://www.tfrrs.org/athletes/#{url}.html"
    self.save!
  end
  
  def has_data?
    !!self.url || Mark.where("athlete_id = ?", self.id).count > 0
  end
  
  def years_array(mark_data)
    if mark_data["Indoor"] && mark_data["Outdoor"]
      min = [mark_data["Indoor"].min_by(&:year).year, mark_data["Outdoor"].min_by(&:year).year].min
      max = [mark_data["Indoor"].max_by(&:year).year, mark_data["Outdoor"].max_by(&:year).year].max
    else
      min, max = mark_data.values.first.minmax_by(&:year).map(&:year)
    end
    
    (min..max).to_a
  end
  
  def mark_array(years, season_data)
    data = []

    years.each do |year|
      mark_to_add = season_data.select { |mark| mark.year == year }.first
      data << (mark_to_add.nil? ? nil : mark_to_add.mark)
    end
    
    data
  end

  def fetch_from_tfrrs
    event_list = get_data(self.url)

    if event_list
      event_list.each do |event|
        add_marks_for_event(event)
      end
    end
  end

  def add_marks_for_event(event)
    self.add_times(event.times_indoor, "Indoor", event.name)
    self.add_times(event.times_outdoor, "Outdoor", event.name)
  end

  def add_times(times_hash, season, event_name)
    times_hash.each do |year, mark|
      prev_mark = self.marks.where(event_name: event_name, year: year.to_i, season: season).first

      if prev_mark
        prev_mark.update_attributes(mark: mark)
      else
        self.marks.new(event_name: event_name, year: year.to_i, season: season, mark: mark)
      end
    end
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
