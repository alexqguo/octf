# 2764966
# http://www.directathletics.com/athletes/track/2764966.html

class MarksController < ApplicationController
  include EventHelper
  include LookupHelper
  include MarksHelper
  
  before_filter :require_admin!, only: [:new, :create, :index, :update, :create, :destroy]
  
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end
  
  def index
    @athlete = Athlete.find(params[:athlete_id])
    @marks = @athlete.marks
  end
  
  def update
    @mark = Mark.find(params[:id])
    
    if request.xhr?
      if @mark.update_attributes(params[:mark])
        render json: @mark
      else
        render json: @mark, status: 422
      end
    else
      unless @mark.update_attributes(params[:mark])
        flash[:errors] = @mark.errors.full_messages
      end

      redirect_to athlete_marks_url(@mark.athlete)
    end
  end
  
  def create
    @athlete = Athlete.find(params[:athlete_id])
    @mark = Mark.new(params[:mark])
    @athlete.marks << @mark
    
    if @athlete.save
      if request.xhr?
        render partial: "marks/edit_form", locals: {athlete: @athlete, mark: @mark}
      else
        redirect_to @athlete
      end
    else
      if request.xhr?
        render json: @mark.errors.full_messages.join(", "), status: 422
      else
        flash[:errors] = @mark.errors.full_messages
        redirect_to athlete_marks_url(@athlete)
      end
    end
  end
  
  def destroy
    @mark = Mark.find(params[:id])
    @mark.destroy
    
    if request.xhr?
      render json: @mark
    else
      redirect_to @mark.athlete
    end
  end
  
end
