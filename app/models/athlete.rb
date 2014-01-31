# == Schema Information
#
# Table name: athletes
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  graduating_class :integer
#

class Athlete < ActiveRecord::Base
  attr_accessible :name, :graduating_class
  
  validates :name, :class, presence: true
  
  has_many :marks, inverse_of: :athlete, dependent: :destroy
  
  def has_data?
    Mark.where("athlete_id = ?", self.id).length > 0
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
  
end
