class VideosController < ApplicationController
	before_filter :require_admin!, only: [:new, :create]

	def index
		@videos = Video.all
	end

	def new
	end

	def create
		@video = Video.new(params[:video])

		if @video.save
			flash[:notice] = "Video successfully created!"
			redirect_to videos_url
		else
			flash[:errors] = @video.errors.full_messages
			redirect_to new_video_url
		end
	end

end
