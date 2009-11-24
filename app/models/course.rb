class Course < ActiveRecord::Base

	has_many :course_instances

	named_scope :ascending, :order => "name ASC"
	named_scope :descending, :order => "name DESC"

end
