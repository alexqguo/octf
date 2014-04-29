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

class Record < ActiveRecord::Base
  attr_accessible :gender, :season, :event, :mark, :record_holder, :date_set, :notes

  validates :gender, :season, :event, :mark, :record_holder, :date_set, presence: true
  validates :gender, inclusion: { in: "men women" }
  validates :season, inclusion: { in: "indoor outdoor" }

  def self.men_indoor
  	where({ gender: "men", season: "indoor" })
  end

  def self.men_outdoor
  	where({ gender: "men", season: "outdoor" })
  end

  def self.women_indoor
  	where({ gender: "women", season: "indoor" })
  end

  def self.women_outdoor
  	where({ gender: "women", season: "outdoor" })
  end

end
