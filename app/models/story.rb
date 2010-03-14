class Story < ActiveRecord::Base
  has_many :fics
  has_many :users, :through => :fics
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
end
