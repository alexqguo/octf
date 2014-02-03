class AthletesController < ApplicationController
  
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
  
end
