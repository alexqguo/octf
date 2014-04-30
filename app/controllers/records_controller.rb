class RecordsController < ApplicationController

	before_filter :require_admin!, only: [:edit, :update]

	def edit
		@record = Record.find(params[:id])
	end

	def update
		@record = Record.find(params[:id])
		
		if @record.update_attributes(params[:record])
			flash[:notice] = "Successfully updated school record!"
			redirect_to records_url
		else
			flash[:errors] = "Error updating record!"
			redirect_to edit_record_url(@record)
		end
	end

end
