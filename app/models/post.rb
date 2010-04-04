class Post < ActiveRecord::Base
  has_attached_file :attachment, :default_url => ''
end
