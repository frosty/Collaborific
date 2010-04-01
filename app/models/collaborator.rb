class Collaborator < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
                 
  # prevent either of these from being crafted by a user request
  attr_protected :user_id, :story_id
  
end
