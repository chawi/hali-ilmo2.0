class Course < ActiveRecord::Base

	has_many :course_instances, :order => "instance_name DESC", :dependent => :destroy
 
	named_scope :courses_ascending, :order => "name ASC"
	named_scope :courses_descending, :order => "name DESC"

	after_create :update_newsfeed

	private
	
	def update_newsfeed
		Newsfeed.course_added(self)
	end

end
