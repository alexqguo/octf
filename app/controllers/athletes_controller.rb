class AthletesController < ApplicationController
  
  before_filter :require_current_user!
  
  def index
    @athletes = Athlete.all
  end
  
  def show
    @athlete = Athlete.find(params[:id])
  end
  
  def create
    # new athlete
  end
  
end
