require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  should_validate_presence_of :owner
  should_validate_presence_of :title
  should_validate_presence_of :description
  should_validate_numericality_of :fic_length, :greater_than => 1, :only_integer => true
  
end
