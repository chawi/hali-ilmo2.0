class AddMultipleExgroupsInCourseInstance < ActiveRecord::Migration
  def self.up
		add_column :course_instances, :max_groups, :integer
		add_column :course_instances, :min_groups, :integer
  end

  def self.down
		remove_column :course_instances, :max_groups
		remove_column :course_instances, :min_groups
  end
end
