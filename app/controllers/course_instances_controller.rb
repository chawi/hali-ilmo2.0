class CourseInstancesController < ApplicationController
 
	def index

	end

	def show
		@ci = CourseInstance.find(params[:id])
		#raise @ci.inspect
	end

	def destroy
		#raise params.inspect
		CourseInstance.destroy(params[:id])
		redirect_to courses_path
	end

end
