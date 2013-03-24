class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :user_roles
  has_many :roles, :through => :user_roles
  has_many :posts, :foreign_key => 'author_id'
  has_many :blogs, :foreign_key => 'owner_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles

  after_create :check_user_role


  def check_user_role
    if User.count == 1
      self.roles << Role.find_by_name("Admin")
    else
      self.roles << Role.find_by_name("User")
    end
  end

  def is?(role)
    self.roles.exists?(:name => role)
  end

  def owned_roles
    self.roles.map(&:name)
  end

end
