module MarksHelper
  
  ALL_EVENTS = [
    "55m",
    "55H",
    "60m",
    "60H",
    "100m",
    "100H",
    "110H",
    "200m",
    "400m",
    "400H",
    "800m",
    "1000m",
    "1500m",
    "Mile",
    "3000m",
    "3000 Steeple",
    "5000m",
    "10,000m",
    "High Jump",
    "Pole Vault",
    "Long Jump",
    "Triple Jump",
    "Shot Put",
    "Discus",
    "Javelin",
    "Hammer",
    "Weight Throw",
    "IPent",
    "Heptathlon",
    "Decathlon"
  ]
  
  def all_events
    ALL_EVENTS
  end
  
  def past_ten_years
    (DateTime.now.year - 10..DateTime.now.year).to_a.reverse
  end
  
end
