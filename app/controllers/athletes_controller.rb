class AthletesController < ApplicationController
  
  before_filter :require_current_user!
  
  def index
  end
  
  def show
    @athlete = Athlete.find(params[:id])
  end
  
  def create
    # new athlete
  end
  
end
