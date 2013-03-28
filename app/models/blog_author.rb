class BlogAuthor < ActiveRecord::Base

  attr_accessible :blog, :role, :user

  belongs_to :user
  belongs_to :blog
  belongs_to :role

  before_create :set_admin_role

  def set_admin_role
    self.role = Role.find_by_name("Admin")
  end

end
