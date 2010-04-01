class Invitation < ActiveRecord::Base

  belongs_to :story
  belongs_to :user

  validates_presence_of :token, :message => "can't be blank"
  validates_uniqueness_of :token
  #validates_uniqueness_of :user, :scope => "story_id"
  # validate_on_create :valid_user?        
                       
  # prevent token crafting
  attr_protected :token

  def self.invitations_for_story(story)
    find(:all, :conditions => {:story_id => story.id}) || nil
  end

private
  # def valid_user? 
  #   if !User.find(user)
  #     errors.add("That user doesn't exist.")
  #   end
  # end

protected
  def before_validation_on_create
    self.token = ActiveSupport::SecureRandom.base64.gsub("/","_").gsub(/=|\+|\?/,"") if self.new_record? and self.token.nil?  
  end

end
