class Registration < ActiveRecord::Base

	belongs_to :user
	belongs_to :exercise_group

	def create
		

		redirect_to courses_url
	end	

end
