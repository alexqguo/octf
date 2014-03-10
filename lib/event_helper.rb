module EventHelper
  
  class Event
  
    attr_reader :name, :times_indoor, :times_outdoor
  
    def initialize(name)
      @name = name    
      @times_indoor = {}
      @times_outdoor = {}
    end
  
    def add_time(time, year, i)
      if i == "Outdoor"
        @times_outdoor[year] = time
      elsif i == "Indoor"
        @times_indoor[year] = time
      end
    end
  
    def to_s
      s = "#{@name}"
    
      if @times_indoor.size > 0
        s << "\nIndoor "
        @times_indoor.each do |year,time|
          s << "-> #{year}: #{time} "
        end
      end
    
      if @times_outdoor.size > 0
        s << "\nOutdoor "
        @times_outdoor.each do |year,time|
          s << "-> #{year}: #{time} "
        end
      end
      
      s << "\n"
    
      s
    end

  end
  
end
