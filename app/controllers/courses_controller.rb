class CoursesController < ApplicationController
	def index
		@courses = Course.find(:all)
 	end

	def show
		@courses = Course.find(params[:id])
 	end

	def create
		Course.create(params[:course])	
	end
end
