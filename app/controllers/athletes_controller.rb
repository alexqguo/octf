class AthletesController < ApplicationController
  include EventHelper
  include LookupHelper
  
  before_filter :require_current_user!, except: [:demo, :graph_data]
  before_filter :require_admin!, only: [:new, :create, :edit]
  
  def index
    @males = Athlete.males.sort_by { |athlete| athlete.name }
    @females = Athlete.females.sort_by { |athlete| athlete.name }
  end
  
  def show
    @athlete = Athlete.find(params[:id])
    @marks_by_event = @athlete.marks_by_event
  end
  
  def demo
    @athlete = Athlete.find_by_name("Alex Guo")
    @marks_by_event = @athlete.marks_by_event
  end
  
  def graph_data
    if request.xhr?
      @athlete = Athlete.find(params[:athlete_id])
      @data = @athlete.highcharts_data
      
      render json: @data
    else
      render json: "Error!", status: 422
    end
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
    url = @athlete.url
    
    event_list = get_data(url)
    if event_list
      event_list.each do |event|
        
        # TODO: DRY THIS UP
        event.times_indoor.each do |year, mark| # key, value
          prev_mark = @athlete.marks.where(year: year.to_i, season: "Indoor", event_name: event.name).first
          if prev_mark
            prev_mark.update_attributes(mark: mark)
          else
            @athlete.marks.new(event_name: event.name, year: year, mark: mark, season: "Indoor")
          end
        end
        
        event.times_outdoor.each do |year, mark|
          prev_mark = @athlete.marks.where(year: year.to_i, season: "Outdoor", event_name: event.name).first
          if prev_mark
            prev_mark.update_attributes(mark: mark)
          else
            @athlete.marks.new(event_name: event.name, year: year, mark: mark, season: "Outdoor")
          end
        end
      end
    end
    
    if @athlete.save
      flash[:notice] = "Data for #{@athlete.name} updated successfully!"
      redirect_to @athlete
    else
      flash[:errors] = @athlete.errors.full_messages
    end
  end
  
end
