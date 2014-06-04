class AthletesController < ApplicationController
  
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
    @athlete = Athlete.find(params[:athlete_id])
    data = @athlete.highcharts_data
    
    render json: data
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
    @athlete.update_url_code(params[:url_code]) if params[:url_code] && params[:url_code] != @athlete.url_code
    @athlete.fetch_from_tfrrs
    
    if @athlete.save
      flash[:notice] = "Data for #{@athlete.name} updated successfully!"
      @athlete.update_attributes(updated_at: DateTime.now)
    else
      flash[:errors] = @athlete.errors.full_messages
    end

    redirect_to @athlete
  end

  def update_all
    Athlete.all.each do |athlete|
      athlete.fetch_from_tfrrs
      athlete.save!
      athlete.update_attributes(updated_at: DateTime.now)
    end

    flash[:notice] = "Successfully fetched TFRRS data for all athletes!"

    redirect_to athletes_url
  end
  
end
