class AthletesController < ApplicationController
  
  before_filter :require_current_user!
  
  def index
    @athletes = Athlete.all
  end
  
  def show
    @athlete = Athlete.find(params[:id])
    @marks_by_event = @athlete.marks_by_event
  end
  
  def create
    # new athlete
  end
  
end
