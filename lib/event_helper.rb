module EventHelper
  
  class Event
  
    attr_reader :name, :times_indoor, :times_outdoor
  
    def initialize(name)
      @name = name    
      @times_indoor = {}
      @times_outdoor = {}
    end
  
    def add_time(time, year, i)
      if i == 0
        @times_outdoor[year] = time
        @times_outdoor = Hash[@times_outdoor.sort] # Keeps it sorted upon entry
      elsif i == 1
        @times_indoor[year] = time
        @times_indoor = Hash[@times_indoor.sort]
      end
    end
  
    def is_distance?
      @is_distance == 2
    end
  
    def display # Displays the data as a string for testing purposes only
      puts @name
      @times_indoor.each do |year,time|
        puts "Indoor - #{year}: #{time}"
      end
      @times_outdoor.each do |year,time|
        puts "Outdoor - #{year}: #{time}"
      end
    end
  
    def to_s()
      s = "#{@name}"
    
      if @times_indoor.size > 0
        s << "\nIndoor "
      end
      @times_indoor.each do |year,time|
        s << "-> #{year}: #{time} "
      end
    
      if @times_outdoor.size > 0
        s << "\nOutdoor "
      end
      @times_outdoor.each do |year,time|
        s << "-> #{year}: #{time} "
      end
      s << "\n\n"
    
      s
    end

  end
  
end