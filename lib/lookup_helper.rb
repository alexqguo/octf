include EventHelper
require 'open-uri'

module LookupHelper
  
  # This gathers the selected athlete's name once its URL is found
  # by going to the athlete's page on directathletics.com
  def get_data(url)
    event_list = []
  
    doc = Nokogiri::HTML(open(url, 'User-Agent' => 'firefox'))
    tables = doc.xpath("//table") # this is a Nokogiri::XML::Element
    first = tables[2].inner_text.split("\n")
                     .map { |el| el.strip }
                     .reject { |el| el == "" }
    first.each do |event| 
      unless ["Year", "Season", "Class", "Sport"].include?(event)
        event_list << Event.new(event)
      end
    end
    
    rows = tables[3]
    
    rows.children.each do |row|
      next if row.inner_text == "\n"
      
      cur_row = row.inner_text.split("\n").reject { |x| x == "" }
      year = cur_row[0]
      season = cur_row[1]
      event_list_idx = 0
      
      cur_row[(cur_row.length - event_list.length)..-1].each do |mark|
        float = format_to_float(mark)
        unless mark.include?("-- --") || float == 0.0 # prevents weird bug
          
          event_list[event_list_idx].add_time(float, year, season)
        end
        
        event_list_idx += 1
      end
    end
    
    event_list
  end

  # This formats a string representation of a float into a float
  # So if it's in hour:minute:second format, it will change it into just a float
  def format_to_float(str)
    return str.to_f if !str.include?(":")
  
    array = str.split(":").reverse!
    total = 0.0
    array.each_with_index do |x, i|
      if i == 0
        total += x.to_f
      else
        total += (x.to_f * (60 ** i))
      end
    end
  
    total
  end

end
