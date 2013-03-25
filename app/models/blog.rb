class Blog < ActiveRecord::Base
  attr_accessible :author_id, :name, :slug, :owner_id

  has_many :posts, :dependent => :destroy
  has_many :users
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'


  validates_presence_of :name
  validates :slug, :uniqueness => true

  before_create :prepare_slug
  before_update :prepare_slug

  def prepare_slug
    self.slug = name.parameterize
  end

end
