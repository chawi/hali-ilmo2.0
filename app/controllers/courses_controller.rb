class CoursesController < ApplicationController	

	skip_before_filter :login_required, :only => [ :index, :show ]

	def index	
		@courses = Course.ascending.find(:all)
 	end 

	def show
		@course = Course.find(params[:id])
		@ci = @course.course_instances
 	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(params[:course])

		 if @course.save 
			flash[:notice] = 'Kurssi luotu'  
			redirect_to root_url
		else  
			render :action => "new" 
		end 

	end

	def update
		#Course.update__(params[:course])
	end
end
