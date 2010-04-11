class Post < ActiveRecord::Base
  validates_presence_of :title, :body

  has_many :assets, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  belongs_to :user
end
