# == Schema Information
#
# Table name: athletes
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  graduating_class :integer
#

class Athlete < ActiveRecord::Base
  attr_accessible :name, :graduating_class
  
  validates :name, :class, presence: true
end
