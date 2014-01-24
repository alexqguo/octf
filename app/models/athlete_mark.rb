# == Schema Information
#
# Table name: athlete_marks
#
#  id         :integer          not null, primary key
#  athlete_id :integer          not null
#  mark_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AthleteMark < ActiveRecord::Base
  attr_accessible :athlete_id, :mark_id
  
  validates :athlete_id, :mark_id, presence: true
  validates :athlete_id, uniqueness: { scope: :mark_id }
end
