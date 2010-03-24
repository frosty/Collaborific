require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def test_should_not_save_story_without_title
    story = Story.new
    assert !story.save, "Saved a story without a title."
  end
  
  should_validate_presence_of :owner
  should_validate_presence_of :title
  should_validate_presence_of :description
  #should_validate_numericality_of :fic_length, :greater_than => 1, :only_integer => true
  
end
