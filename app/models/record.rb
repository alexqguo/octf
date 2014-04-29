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

  ALL_EVENTS = [
	"55m Dash",
	"60m Dash",
  	"100m Dash",
	"200m Dash",
	"300m Dash",
	"400m Dash",
	"500m Dash",
	"800m Run",
	"1000m Run",
	"1500m Run",
	"1 Mile Run",
	"3000m Run",
	"5000m Run",
	"10000m Run",
	"55m Hurdles",
	"60m Hurdles",
	"100m Hurdles",
	"400m Hurdles",
	"3000m Steeplechase",
	"Long Jump",
	"Triple Jump",
	"High Jump",
	"Pole Vault",
	"Shot Put",
	"Discus",
	"Hammer Throw",
	"Javelin",
	"Weight Throw",
	"Pentathlon",
	"Heptathlon",
	"Indoor Pentathlon",
	"Decathlon",
	"4x100m Relay",
	"4x400m Relay",
	"4x200m Relay",
	"4000m Distance Medley Relay"
  ]

  validates :gender, :season, :event, :mark, :record_holder, :date_set, presence: true
  validates :gender, inclusion: { in: "men women", allow_nil: true }
  validates :season, inclusion: { in: "indoor outdoor", allow_nil: true }
  validates_inclusion_of :event, in: ALL_EVENTS, allow_nil: true

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