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

require 'test_helper'

class AthleteMarkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
