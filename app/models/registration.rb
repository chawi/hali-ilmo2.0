class Registration < ActiveRecord::Base

	belongs_to :user
	belongs_to :exercise_group

	#after_create :update_newsfeed

	#private
	
	#def update_newsfeed 
	#	raise eg.inspect
	#	Newsfeed.into_exercise_group(user, eg)
	#end

	def self.update_newsfeed(user, eg)
		Newsfeed.into_exercise_group(user, eg)
	end

end
