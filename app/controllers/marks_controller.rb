class MarksController < ApplicationController
  include EventHelper
  include LookupHelper
  
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end
  
  def create
    
  end
  
end
