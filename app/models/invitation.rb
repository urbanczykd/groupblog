class Invitation < ActiveRecord::Base
  #attr_accessible :title, :body

  belongs_to :user
  belongs_to :blog
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'

  validates_presence_of :blog_id
  validates_presence_of :owner_id
  validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  

  before_create :generate_code
  after_create :send_invitation

  def generate_code
    seed = "--#{rand(10000)}--#{Time.now}--"
    self.code = Digest::SHA1.hexdigest(seed)
  end


  def send_invitation
    Mail.deliver do
       from    owner.email
       to      self.email
       subject 'I want to invite You to my blog'
       body    "Please register or if You are registered accept invitation on panel #{url_for("cc")}"
    end
  end


end
