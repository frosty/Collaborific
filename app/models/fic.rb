class Fic < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  
  validates_presence_of :content, :message => "is blank"
  validate :valid_content_length?
  
  def rss_content
    content + "<br/><br/>Written by: #{user.login}"
  end
  
private
  def valid_content_length?
    story.fic_length_enforce && content.split(" ").size > story.fic_length
  end
end
