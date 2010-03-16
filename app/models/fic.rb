class Fic < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  
  validates_presence_of :content, :message => "is blank"
end
