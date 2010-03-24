require 'test_helper'

class FicTest < ActiveSupport::TestCase
  fixtures :all
  
  should_belong_to :user
  should_belong_to :story
  
  test "should validate presence of content" do
    assert_raise (ActiveRecord::RecordInvalid) {
      @fic = Fic.make(:content => nil)
    }
    #assert_match(/must be shorter than \d+ words./, @fic.errors.on(:content))
  end
  
  test "should validate content length when enforce is enabled" do
    assert_raise (ActiveRecord::RecordInvalid) {
      fic = Fic.make(:content => "Three words long", 
                     :story => Story.make(:fic_length => 2, 
                                           :fic_length_enforce => true))
    }
    #assert_equal("must be shorter than 2 words.", @fic.errors.on(:content))
  end
  
  test "should not validate content length when enforce is disabled" do
    assert_nothing_raised (ActiveRecord::RecordInvalid) {
      @fic = Fic.make(:content => "Three words long", 
                     :story => Story.make(:fic_length => 2, 
                                           :fic_length_enforce => false))
    }
    assert @fic.save
  end
  
  test "should save a valid fic" do
    fic = Fic.make
    assert fic.save
  end
end