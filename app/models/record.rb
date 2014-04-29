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
	"Helptathlon",
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

=begin

Record.create({ 
	gender: "men", season: "indoor", event: "55m Dash", mark: "6.57", record_holder: "Edo Bedzra/Solomon Turner", date_set: "March 4, 2005/February 6, 2009", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "60m Dash", mark: "7.16", record_holder: "Shawn Chrapczynski", date_set: "March 2, 2012", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "200m Dash", mark: "22.51", record_holder: "Solomon Turner", date_set: "March 6, 2009", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "300m Dash", mark: "36.06", record_holder: "Shawn Chrapczynski", date_set: "December 9, 2011", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "400m Dash", mark: "50.10", record_holder: "Ted Lytle", date_set: "1996", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "500m Dash", mark: "1:06.56", record_holder: "Ted Lytle", date_set: "1996", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "800m Run", mark: "1:55.32", record_holder: "Lynn Seltzer", date_set: "1969", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "1000m Run", mark: "2:32.52", record_holder: "Quinn Hull", date_set: "February 18, 2011", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "1500m Run", mark: "4:05.49", record_holder: "Harsha Thirumurthy", date_set: "March 4, 1998", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "1 Mile Run", mark: "4:21.75", record_holder: "Ryan King", date_set: "February 29, 2008", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "3000m Run", mark: "8:35.66", record_holder: "Geno Arthur", date_set: "February 22, 2014", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "5000m Run", mark: "15:12.90", record_holder: "Ben Schild", date_set: "March 5, 2010", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "55m Hurdles", mark: "7.92", record_holder: "Chris Andrews", date_set: "March 1, 1990", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "60m Hurdles", mark: "8.86", record_holder: "Jerry Choi", date_set: "December 9, 2012", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "Long Jump", mark: "7.43m", record_holder: "Tony Osei", date_set: "1978", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "Triple Jump", mark: "13.96m", record_holder: "Alex Guo", date_set: "March 4, 2013", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "High Jump", mark: "1.98m", record_holder: "Clarence Roland", date_set: "1980", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "Pole Vault", mark: "4.41m", record_holder: "Sean Perry", date_set: "2005", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "Weight Throw", mark: "14.05m", record_holder: "Josh Gallagher", date_set: "February 18, 2011", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "Shot Put", mark: "15.58m", record_holder: "John Morton", date_set: "1972", notes: "" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "Indoor Pentathlon", mark: "3105", record_holder: "Shawn Chrapczynski", date_set: "February 27, 2012", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "Heptathlon", mark: "3989", record_holder: "Sean Dembowski", date_set: "February 25, 2013", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "4x200m Relay", mark: "1:32.16", record_holder: "Turner, Shaw, Chrapczynski, Wimberly", date_set: "March 6, 2010", notes: "NCAC Meet" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "4x400m Relay", mark: "3:22.77", record_holder: "Turner, Morris, El-Shair, Wimberly", date_set: "March 6, 2009", notes: "NCAC Meet, NCAC Record" 
})
Record.create({ 
	gender: "men", season: "indoor", event: "4000m Distance Medley Relay", mark: "10:30.62", record_holder: "Moreton, Choi, Taylor, Arthur", date_set: "March 8, 2014", notes: "NCAC Meet" 
})

	
=end