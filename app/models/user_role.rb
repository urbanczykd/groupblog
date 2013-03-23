class UserRole < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => [:role_id]
  
  attr_accessible :user
  
end
