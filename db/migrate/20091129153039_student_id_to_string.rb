class StudentIdToString < ActiveRecord::Migration
  def self.up
		change_column :users, :studentId, :String
  end

  def self.down
  end
end
