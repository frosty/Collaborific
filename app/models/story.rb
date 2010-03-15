class Story < ActiveRecord::Base
  has_many :fics
  #has_many :users, :through => :fics
  belongs_to :owner, :class_name => "User", :foreign_key => "owner"
  has_many :collaborators
  has_many :users, :through => :collaborators
  
  validates_presence_of :owner
  validates_presence_of :title
  validates_presence_of :description
end
