class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  has_attached_file :attachment
end
