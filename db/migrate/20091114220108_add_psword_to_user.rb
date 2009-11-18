class AddPswordToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :psword, :string
  end

  def self.down
    remove_column :users, :psword
  end
end
