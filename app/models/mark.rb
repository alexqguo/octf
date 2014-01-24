# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  event      :string(255)      not null
#  year       :integer          not null
#  mark       :integer          not null
#  season     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mark < ActiveRecord::Base
  attr_accessible :event, :year, :mark, :season
  
  validates :event, :year, :mark, :season, presence: true
  validates :season, inclusion: { in: "INDOOR OUTDOOR" }
end
