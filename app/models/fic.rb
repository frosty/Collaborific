class Fic < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  
  validates_presence_of :content, :message => "is blank", :on => :create
 # validates_length_of :content, :maximum => story.fic_length, :tokenizer =>  lambda {|str| str.scan(/\w+/)}, :if => :enforce_fic_length?
  validate :valid_content_length?, :on => [:create, :save]
                                
  def rss_content
    content + "<br/><br/>Written by: #{user.login}"
  end
  
private
  def valid_content_length?
    errors.add(:content, " must be shorter than #{story.fic_length} words.") if (story.fic_length_enforce && content.split(" ").size > story.fic_length)
  end
  
  def enforce_fic_length?
    story.fic_length_enforce && (story.fic_length > 0)
  end
end
