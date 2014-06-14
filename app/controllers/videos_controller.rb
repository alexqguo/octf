class VideosController < ApplicationController
	before_filter :require_admin!, only: [:new, :create]

	def index
		@videos = Video.all
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(params[:video])

		if @video.save
			flash[:notice] = "Video successfully added!"
			redirect_to videos_url
		else
			flash.now[:errors] = @video.errors.full_messages
			render :new
		end
	end

end
