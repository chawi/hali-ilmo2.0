class AddCourseToInstance < ActiveRecord::Migration
  def self.up
		add_column :course_instances, :instance_name, :string
		add_column :course_instances, :course, :course
  end

  def self.down
  end
end
