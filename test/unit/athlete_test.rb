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

require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
