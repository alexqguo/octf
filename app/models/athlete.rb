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
  
  has_many :marks, inverse_of: :athlete, dependent: :destroy
  
  def has_data?
    Mark.where("athlete_id = ?", self.id).length > 0
  end
  
end
