class AddStudentIdToUser < ActiveRecord::Migration
  def self.up
		add_column :users, :studentId, :int
		add_column :users, :realName, :string
  end

  def self.down
  end
end
