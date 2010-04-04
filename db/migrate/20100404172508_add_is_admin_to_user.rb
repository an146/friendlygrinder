class AddIsAdminToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :is_admin, :boolean
    User.find(:all).each do |u|
      u.update_attribute :is_admin, false
    end
  end

  def self.down
    remove_column :users, :is_admin
  end
end
