require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  should_belong_to :story
  should_belong_to :user
  should_validate_uniqueness_of :token
  
  # we can't use should_validate_presence_of because the model automatically
  # creates a token if you don't pass in one. Instead, we have to check that
  # one gets created. This also tests before_validation_on_create - do we need
  # a separate test for that?
  def test_can_not_create_an_invitation_without_a_token
    invite = Invitation.make(:token => nil)
    assert_not_nil invite.token
  end
  
  def test_should_return_the_invitations_for_a_given_story
    story = Story.make
    story.save
    3.times { Invitation.make(:story => story) }
    invitations = Invitation.invitations_for_story(story)
    assert_equal(3, invitations.count)
    invitations.each {|i| assert_equal i.story, story }
  end
  
  def test_should_create_an_invitation
    invite = Invitation.make
    assert invite.save
    assert !invite.new_record?
  end
end
