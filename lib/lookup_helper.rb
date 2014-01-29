include EventHelper

module LookupHelper
  
  # This gathers the selected athlete's name once its URL is found
  # by going to the athlete's page on directathletics.com
  def get_data(url)
    event_list = []
  
    doc = Nokogiri::HTML(open(url))
    table = doc.xpath("//table")[1] #this is a Nokogiri::XML::Element
    rows = table.xpath("tr") #array of Nokogiri elements for each row
  
    #Getting the list of events
    first_row = []
    first = table.xpath("thead") #first row of table that has events

    return if first.to_s == "" #Break if there is no data on this page

    first.inner_text().split("\n").each do |line|
      line = line.strip
      unless line=="" or line=="Year" or line=="Class" or line=="Season"
        event_list << Event.new(line) #Add the event 
      end
    end
    num_events = event_list.length

    rows.each do |x| #For each row
      cur_row = x.inner_text().split("\n")
      cur_year = cur_row[1].to_i
      cur_season = cur_row[3] == "Outdoor" ? 0 : 1
      event_list_index = 0
  
      cur_row.each_with_index do |el, i| #For each element
        el = el.strip
        unless el=="" or i<7 #Unless it's blank OR not an actual time
      
          unless el == "-"
            event_list[event_list_index].add_time(format_to_float(el),cur_year,cur_season)
          end
      
          event_list_index += 1
        end
      end
    end

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