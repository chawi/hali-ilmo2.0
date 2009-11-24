class ChangeGroupTimeToName < ActiveRecord::Migration
  def self.up
		rename_column :exercise_groups, :group_time, :name 
  end

  def self.down
  end
end
