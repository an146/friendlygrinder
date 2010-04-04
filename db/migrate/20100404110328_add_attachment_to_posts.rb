class AddAttachmentToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :attachment_file_name, :string # Original filename
    add_column :posts, :attachment_content_type, :string # Mime type
    add_column :posts, :attachment_file_size, :integer # File size in bytes
  end

  def self.down
    remove_column :posts, :attachment_file_name
    remove_column :posts, :attachment_content_type
    remove_column :posts, :attachment_file_size
  end
end
