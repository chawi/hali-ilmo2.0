class GroupTimeToExGroup < ActiveRecord::Migration
  def self.up
		add_column :exercise_groups, :group_time, :String
  end

  def self.down
		remove_column :exercise_groups, :group_time
  end
end
