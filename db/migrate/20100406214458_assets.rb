class Assets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.references :post

      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.timestamps
    end
    add_index :assets, :post_id

    change_table :posts do |t|
      t.remove :attachment_file_name
      t.remove :attachment_content_type
      t.remove :attachment_file_size
    end
  end

  def self.down
    drop_table :assets
    change_table :posts do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
    end
  end
end
