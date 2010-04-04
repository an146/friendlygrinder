class AddUserToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer, :default => 1
    add_index :posts, :user_id
  end

  def self.down
    remove_column :posts, :user_id
  end
end
