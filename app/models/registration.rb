class Registration < ActiveRecord::Base

	belongs_to :user
	belongs_to :exercise_group

	after_create :update_newsfeed

	private
	
	def update_newsfeed #into_exercise_group(user, exgroup)
		#raise params.inspect
		Newsfeed.into_exercise_group(user, eg)
	end

end
