class CourseInstance < ActiveRecord::Base

	belongs_to :course
	has_many :exercise_groups, :order => "name ASC", :dependent => :destroy

end
