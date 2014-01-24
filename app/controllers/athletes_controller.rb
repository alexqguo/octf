class AthletesController < ApplicationController
  
  before_filter :require_current_user!
  
  def index
    render :index
  end
  
  def show
    @athlete = Athlete.find(params[:id])
    render json: @athlete
  end
  
  def create
    # new athlete
  end
  
end
