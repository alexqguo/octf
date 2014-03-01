class AthletesController < ApplicationController
  include EventHelper
  include LookupHelper
  
  before_filter :require_current_user!
  before_filter :require_admin!, only: [:new, :create, :edit]
  
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
    url = @athlete.url

    # TODO: this needs to change
    # Maybe below instead of adding each mark, check to see if a mark with that year and season exists
    # If not, then add
    @athlete.marks.destroy_all
    event_list = get_data(url)
    
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
      flash[:notice] = "Data for #{@athlete.name} updated successfully!"
      redirect_to @athlete
    else
      flash[:errors] = @athlete.errors.full_messages
    end
  end
  
end
