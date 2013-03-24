class Post < ActiveRecord::Base

  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :blog

  validates_presence_of :author_id

  attr_accessible :body, :author_id, :title, :author
end
