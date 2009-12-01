class BuilderController < ApplicationController

	def index	
		#@courses = Course.courses_ascending
		@newsfeed = Newsfeed.newsfeed_descending

		respond_to do |format|
			format.rss
			#format.pdf
		end

 	end 

end
