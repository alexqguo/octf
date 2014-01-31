class MarksController < ApplicationController
  include EventHelper
  include LookupHelper
  # 2764966
  # http://www.directathletics.com/athletes/track/2764966.html
  
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end
  
  def create
    @athlete = Athlete.find(params[:athlete_id])
    @url_code = params[:url_code].to_i
    @url = "http://www.directathletics.com/athletes/track/#{@url_code}.html"

    event_list = get_data(@url)
    
    event_list.each do |event|
      event.times_indoor.each do |year, mark| # key, value
        @athlete.marks.new(event_name: event.name, year: year, mark: mark, season: "Indoor")
      end
      event.times_outdoor.each do |year, mark|
        @athlete.marks.new(event_name: event.name, year: year, mark: mark, season: "Outdoor")
      end
    end
    
    if @athlete.save
      flash[:notice] = "Data for #{@athlete.name} imported successfully!"
      redirect_to @athlete
    else
      flash[:errors] = @athlete.errors.full_messages
    end
  end
  
end
