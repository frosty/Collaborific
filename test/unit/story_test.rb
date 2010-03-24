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
    story = Story.create(:title => "An ode to beans",
                      :description => "A story about beans",
                      :owner => User.make,
                      :fic_length_enforce => nil, 
                      :fic_length => nil)
    assert story.new_record?
    assert_equal story.fic_length_enforce, false
  end
  
  def test_should_create_a_story
    story = Story.make
    assert story.save
    assert !story.new_record?
  end

  def test_story_owner_should_become_collaborator
    owner = User.make
    owner.save
    story = Story.make(:owner => owner)
    story.save
    assert_equal story.collaborators.first.user, owner
  end
  
  def test_owner?
    owner = User.make
    owner.save
    story = Story.make(:owner => owner)
    story.save
    assert_equal story.owner, owner
    assert_not_equal story.owner, User.make
  end

  def test_next_collaborator_of_ficless_story_is_the_owner
    owner = User.make
    owner.save
    story = Story.make(:owner => owner)
    story.save
    assert_equal Story.next_collaborator_for(story), owner
  end
  
  def test_next_collaborator_progression
    owner = User.make
    owner.save
    story = Story.create(:title => "An ode to beans",
                      :description => "A story about beans",
                      :owner => owner,
                      :fic_length_enforce => nil, 
                      :fic_length => nil)
    story.save
    assert_equal 1, story.collaborators.count                   
    assert_equal Story.next_collaborator_for(story), owner
    user1 = User.make
    user1.save
    user2 = User.make
    user2.save
    story.collaborators << Collaborator.new(:user => user1, :story => story)
    story.collaborators << Collaborator.new(:user => user2, :story => story)
    assert_equal 3, story.collaborators.count
    story.fics << Fic.make(:story => story, :user => owner)
    assert_equal Story.next_collaborator_for(story), user1
    story.fics << Fic.make(:story => story, :user => user1)
    assert_equal Story.next_collaborator_for(story), user2
  end
end