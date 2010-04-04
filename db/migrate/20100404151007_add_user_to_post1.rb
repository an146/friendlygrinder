class AddUserToPost1 < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.change_default :user_id, nil
    end
    Post.find(:all).each do |p|
      if not p.user_id
        p.update_attribute :user_id, 1
      end
    end
  end

  def self.down
    change_table :posts do |t|
      t.change_default :user_id, 1
    end
  end
end
