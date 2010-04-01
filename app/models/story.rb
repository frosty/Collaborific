class Story < ActiveRecord::Base
  has_many :fics
  #has_many :users, :through => :fics
  belongs_to :owner, :class_name => "User", :foreign_key => "owner"
  has_many :collaborators
  has_many :users, :through => :collaborators
  
  validates_presence_of :owner
  validates_presence_of :title
  validates_presence_of :description
  validates_numericality_of :fic_length, :greater_than => 1, :only_integer => true, :allow_nil => true
  
  before_create {|story| story.fic_length_enforce = false if story.fic_length_enforce.nil?}
  after_save {|story| story.collaborators.create(:user => story.owner, :story => story)}
  
  # owner should be set already - other attributes are choice of user
  # attr_protected :owner  # this is currently failing tests:
  
  #   1) Failure:
  # test_fic_length_enforce_should_be_false_if_nil(StoryTest) [/test/unit/story_test.rb:41]:
  # <nil> expected but was
  # <false>.
  # 
  #   2) Failure:
  # test_next_collaborator_progression(StoryTest) [/test/unit/story_test.rb:84]:
  # <1> expected but was
  # <0>.       
  
  def owner?(user)
    owner == user
  end
  
  class << self
    def next_collaborator_for(story)
       raise ArgumentError "Require an instance of Story" unless story.is_a? Story
       collab_ids = story.collaborators.map(&:user_id)
       if collab_ids.size == 1
         next_collab_id = collab_ids[0]
       else
         if !story.fics.empty?
           last_collab_id = story.fics.last.user_id
           last_collab_index = collab_ids.index(last_collab_id) || -1
           last_collab_index = -1 if collab_ids.last == last_collab_id
         else
            last_collab_index = -1
         end
         next_collab_id = collab_ids[last_collab_index + 1]
       end
        
       User.find_by_id(next_collab_id)
    end
  end
end
