class Comment < ActiveRecord::Base
  validates_presence_of :author
  validates_presence_of :body

  belongs_to :user
  belongs_to :post
end
