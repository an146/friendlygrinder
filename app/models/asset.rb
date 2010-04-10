class Asset < ActiveRecord::Base
  has_attached_file :attachment, :url => "/:attachment/:post_id/:filename"
  belongs_to :post
  validates_presence_of :attachment_file_name, :attachment_content_type, :attachment_file_size

  def url(*args)
    attachment.url(*args)
  end

  def name
    attachment_file_name
  end

  def content_type
    attachment_content_type
  end

  def file_size
    attachment_file_size
  end
end
