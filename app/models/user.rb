class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  belongs_to :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  after_create :check_user_role


  def check_user_role
    if User.count == 1
      update_attributes(:role => Role.find_by_name("Admin"))
    else
      update_attributes(:role => Role.find_by_name("User"))
    end
  end

  def is
    role.name
  end


end
