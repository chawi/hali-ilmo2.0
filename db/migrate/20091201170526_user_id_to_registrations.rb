class UserIdToRegistrations < ActiveRecord::Migration
  def self.up
		add_column :registrations, :user_id, :integer
		add_column :registrations, :exercise_group_id, :integer
  end

  def self.down
		remove_column :registrations, :user_id
		remove_column :registrations, :exercise_group_id
  end
end
