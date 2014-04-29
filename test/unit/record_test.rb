# == Schema Information
#
# Table name: records
#
#  id            :integer          not null, primary key
#  gender        :string(255)      not null
#  season        :string(255)      not null
#  event         :string(255)      not null
#  mark          :string(255)      not null
#  record_holder :string(255)      not null
#  date_set      :string(255)      not null
#  notes         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
