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
  validates :season, inclusion: { in: "Indoor Outdoor" }
  
  belongs_to :athlete, inverse_of: :marks
end
