class BlogAuthor < ActiveRecord::Base

  attr_accessible :blog, :role, :user

  belongs_to :user
  belongs_to :blog
  belongs_to :role

end
