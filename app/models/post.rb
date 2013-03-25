class Post < ActiveRecord::Base
  acts_as_commentable

  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :blog

  validates_presence_of :author_id

  attr_accessible :body, :author_id, :title, :author, :blog, :blog_id
end
