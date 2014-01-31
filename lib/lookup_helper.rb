include EventHelper
require 'open-uri'

# NOTE!! I wrote this a while ago so it's not the cleanest thing
# I've made small tweaks here and there --ag, 1/30/2014
module LookupHelper
  
  # This gathers the selected athlete's name once its URL is found
  # by going to the athlete's page on directathletics.com
  def get_data(url)
    event_list = []
  
    doc = Nokogiri::HTML(open(url))
    table = doc.xpath("//table")[1] # this is a Nokogiri::XML::Element
    rows = table.xpath("tr") # array of Nokogiri elements for each row
  
    # Getting the list of events
    first_row = []
    first = table.xpath("thead") # first row of table that has events

    return if first.to_s == "" # Break if there is no data on this page

    first.inner_text().split("\n").each do |line|
      line = line.strip
      
      unless line == "" || line == "Year" || line == "Class" || line == "Season"
        event_list << Event.new(line) #Add the event 
      end
    end
    
    rows.each do |row| #For each row
      cur_row = row.inner_text.split("\n").select { |el| 
        el == "-" || el == "Indoor" || el == "Outdoor" || el.to_f != 0.0
      }
      cur_year = cur_row[0].to_i
      cur_season = cur_row[1]
      event_list_index = 0

      cur_row.each_with_index do |mark, idx|
        next if idx <= 1
        unless mark == "-"
          event_list[event_list_index].add_time(format_to_float(mark), cur_year, cur_season)
        end
        event_list_index += 1
      end
      
    end
    
    event_list
  end

  # This formats a string representation of a float into a float
  # If it's in hour:minute:second format, it will change it into just a float
  def format_to_float(str)
    return str.to_f if !str.include?(":")
  
    array = str.split(":").reverse!
    total = 0.0
    array.each_with_index do |x, i|
      if i == 0
        total += x.to_f
      else
        total += (x.to_f * (60**i))
      end
    end
  
    total
  end

end