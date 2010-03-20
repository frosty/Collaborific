class Invitation < ActiveRecord::Base

  belongs_to :story
  belongs_to :user

  validates_presence_of :token
  validates_uniqueness_of :token
  #validates_uniqueness_of :user, :scope => "story_id"

protected
  def before_validation_on_create
    self.token = ActiveSupport::SecureRandom.base64.gsub("/","_").gsub(/=|\+|\?/,"") if self.new_record? and self.token.nil?  
  end

end
