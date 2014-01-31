class MarksController < ApplicationController
  include EventHelper
  include LookupHelper
  # 2764966
  # http://www.directathletics.com/athletes/track/2764966.html
  
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end
  
  def create
    @url_code = params[:url_code].to_i
    @url = "http://www.directathletics.com/athletes/track/#{@url_code}.html"

    event_list = get_data(@url)
    
    render json: event_list
  end
  
end
