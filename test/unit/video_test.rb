# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  url        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)      not null
#  author     :string(255)      not null
#  duration   :string(255)      not null
#  uid        :string(255)      not null
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
