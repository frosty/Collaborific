require 'test_helper'

class FicTest < ActiveSupport::TestCase
  fixtures :all
  
  should_belong_to :user
  should_belong_to :story
  
  def test_should_validate_presence_of_content
    assert_raise (ActiveRecord::RecordInvalid) {
      @fic = Fic.make(:content => nil)
    }
    #assert_match(/must be shorter than \d+ words./, @fic.errors.on(:content))
  end
  
  def test_should_validate_content_length_when_enforce_is_enabled
    assert_raise (ActiveRecord::RecordInvalid) {
      fic = Fic.make(:content => "Three words long", 
                     :story => Story.make(:fic_length => 2, 
                                           :fic_length_enforce => true))
    }
    #assert_equal("must be shorter than 2 words.", @fic.errors.on(:content))
  end
  
  def test_should_not_validate_content_length_when_enforce_is_disabled
    assert_nothing_raised (ActiveRecord::RecordInvalid) {
      @fic = Fic.make(:content => "Three words long", 
                     :story => Story.make(:fic_length => 2, 
                                           :fic_length_enforce => false))
    }
    assert @fic.save
  end
  
  def test_should_create_a_fic
    fic = Fic.make
    assert fic.save
    assert !fic.new_record?
  end
end