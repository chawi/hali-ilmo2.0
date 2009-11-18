class CoursesController < ApplicationController	

	skip_before_filter :login_required, :only => [ :index, :show ]

	def index	
		@courses = Course.find(:all)
		
 	end 

	def show
		@courses = Course.find(params[:id])
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
