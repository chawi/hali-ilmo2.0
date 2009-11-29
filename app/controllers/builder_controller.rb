class BuilderController < ApplicationController

	def index	
		@courses = Course.courses_ascending

		respond_to do |format|
			format.rss
			#format.pdf
		end

 	end 

end
