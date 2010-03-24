require 'test_helper'

class CollaboratorTest < ActiveSupport::TestCase
  should_belong_to :user
  should_belong_to :story
end
