class AthletesController < ApplicationController
  include EventHelper
  include LookupHelper
  
  before_filter :require_current_user!
  
  def index
    @males = Athlete.males.sort_by { |athlete| athlete.name }
    @females = Athlete.females.sort_by { |athlete| athlete.name }
  end
  
  def show
    @athlete = Athlete.find(params[:id])
    @marks_by_event = @athlete.marks_by_event
  end
  
  def new
    @athlete = Athlete.new
  end
  
  def create
    @athlete = Athlete.new(params[:athlete])
    
    if @athlete.save
      redirect_to @athlete
    else
      flash.now[:errors] = @athlete.errors.full_messages
      render :new
    end
  end
  
  def edit
    @athlete = Athlete.find(params[:id])
  end
  
  def update
    @athlete = Athlete.find(params[:id])
    @url_code = params[:url_code].to_i
    @url = "http://www.directathletics.com/athletes/track/#{@url_code}.html"
    
    @athlete.marks.destroy_all
    
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
      flash[:notice] = "Data for #{@athlete.name} updated successfully!"
      redirect_to @athlete
    else
      flash[:errors] = @athlete.errors.full_messages
    end
  end
  
end
