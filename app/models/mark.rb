# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  athlete_id :integer          not null
#  season     :string(255)
#  event_name :string(255)
#  mark       :float
#

class Mark < ActiveRecord::Base
  attr_accessible :event_name, :year, :mark, :season
  
  validates :event_name, :year, :mark, :season, :athlete, presence: true
  validates :season, inclusion: { in: "Indoor Outdoor", allow_nil: true }
  validate :mark_is_valid
  # Note: Currently you can create an event with any name. I'm leaving it for now.
  
  belongs_to :athlete, inverse_of: :marks
  
  def units_of_measurement
    if Athlete::FIELD_EVENTS.include?(self.event_name)
      "Distance (meters)"
    elsif Athlete::MULTI_EVENTS.include?(self.event_name)
      "Points"
    else
      "Time (seconds)"
    end
  end
  
  def is_running_event?
    Athlete::FIELD_EVENTS.exclude?(self.event_name) && Athlete::MULTI_EVENTS.exclude?(self.event_name)
  end
  
  private
  
  def mark_is_valid
    puts mark
    errors[:mark] << "must be a valid mark" if self.mark.nil? || self.mark <= 0
  end
  
end
