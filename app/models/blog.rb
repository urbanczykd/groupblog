class Blog < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  has_many   :posts, :dependent => :destroy
  has_many :blog_authors, :inverse_of => :blog
  has_many :users, :through => :blog_authors, :dependent => :destroy
  
  attr_accessible :author_id, :name, :slug, :owner_id, :user_id



  before_validation :prepare_slug
  validates_presence_of :name
  validates :slug, :uniqueness => true

  def prepare_slug
    self.slug = name.parameterize
  end


end
