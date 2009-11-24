class CourseInstancesController < ApplicationController
 
	def index

	end

	def show
		@ci = CourseInstance.find(params[:id])
	end


end
