class RecordsController < ApplicationController

	before_filter :require_admin!, only: [:edit, :update]

	def edit
		@record = Record.find(params[:id])
	end

	def update
		fail
	end

end
