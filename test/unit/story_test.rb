require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  should_have_many :fics
  should_belong_to :owner
  should_have_many :collaborators
  should_have_many :users, :through => :collaborators
  
  should_validate_presence_of :owner
  should_validate_presence_of :title
  should_validate_presence_of :description
  should_validate_numericality_of :fic_length
  
  def test_fic_length_should_be_an_integer
    assert_raises (ActiveRecord::RecordInvalid) {
      story = Story.make(:fic_length => 2.0)
      assert_equals story.errors.on(:fic_length), "Fic length is not a number"
    }
  end
  
  def test_fic_length_should_be_greater_than_one
    assert_raises (ActiveRecord::RecordInvalid) {
      story = Story.make(:fic_length => -1)
      assert_equals story.errors.on(:fic_length), "Fic length is less than 1"
    }
  end
  
  def test_fic_length_can_be_nil
    story = Story.make(:fic_length => nil)
    assert story.save
  end
  
  def test_fic_length_enforce_should_be_false_if_nil
    story = Story.make(:fic_length_enforce => nil)
    story.save
    assert_equal story.fic_length_enforce, false
  end
  
  def test_should_create_a_story
    story = Story.make
    assert story.save
    assert !story.new_record?
  end

  def test_story_owner_should_become_collaborator
    
  end


end


#   before_create {|story| story.fic_length_enforce = false if  story.fic_length_enforce.nil?}
#   after_save {|story| story.collaborators.create(:user => story.owner, :story => story)}
#   
#   def owner?(user)
#     owner == user
#   end
#   
#   class << self
#     def next_collaborator_for(story)
#        raise ArgumentError "Require an instance of Story" unless story.is_a? Story
#        collab_ids = story.collaborators.map(&:user_id)
#        if collab_ids.size == 1
#          next_collab_id = collab_ids[0]
#        else
#          if !story.fics.empty?
#            last_collab_id = story.fics.last.user_id
#            last_collab_index = collab_ids.index(last_collab_id) || -1
#            last_collab_index = -1 if collab_ids.last == last_collab_id
#          else
#             last_collab_index = -1
#          end
#          next_collab_id = collab_ids[last_collab_index + 1]
#        end
#         
#        User.find_by_id(next_collab_id)
#     end
#   end
# end
