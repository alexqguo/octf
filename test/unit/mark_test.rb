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

require 'test_helper'

class MarkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
