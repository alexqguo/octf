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

require 'test_helper'

class MarkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
