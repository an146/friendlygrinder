class Asset < ActiveRecord::Base
  has_attached_file :attachment, :url => "/:attachment/:post_id/:filename"
  belongs_to :post

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
