# 2764966
# http://www.directathletics.com/athletes/track/2764966.html

class MarksController < ApplicationController
  include EventHelper
  include LookupHelper
  
  before_filter :require_admin!, only: [:new, :create, :index, :update]
  
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end
  
  def create
    @athlete = Athlete.find(params[:athlete_id])
    @url_code = params[:url_code].to_i
    @url = "http://www.tfrrs.org/athletes/#{@url_code}.html"

    event_list = get_data(@url)
    
    if event_list
      event_list.each do |event|
        event.times_indoor.each do |year, mark| # key, value
          @athlete.marks.new(event_name: event.name, year: year, mark: mark, season: "Indoor")
        end
        event.times_outdoor.each do |year, mark|
          @athlete.marks.new(event_name: event.name, year: year, mark: mark, season: "Outdoor")
        end
      end
    end
    
    if @athlete.save
      @athlete.update_attributes(url: @url)
      flash[:notice] = "Data for #{@athlete.name} imported successfully!"
      redirect_to @athlete
    else
      flash[:errors] = @athlete.errors.full_messages
    end
  end
  
  def index
    @athlete = Athlete.find(params[:athlete_id])
    @marks = @athlete.marks
  end
  
  def update
    @mark = Mark.find(params[:id])

    if @mark.update_attributes(params[:mark])
      render json: @mark
    else
      render json: @mark.errors.full_messages, status: 422
    end
  end
  
end
