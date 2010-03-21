Feature: Writing fics
  As an author
  I want to add fics to stories
  So I can contribute to a collaborative story
  
  Background:
    Given a logged in user
    Given there are stories in existence
    Given I am on the story page

 # Fic scenarios need rewriting, as turn-taking completely alters how this works.
  # Scenario: Add a fic
  #   Then I should see "Add fic"
  #   When I follow "Add fic"
  #   Then I should be on the new fic page
  # 
  # Scenario: Add a fic
  #   And I follow "Add fic"
  #   And I press "Add fic"
  #   Then I should see "There was a problem adding your fic."
  # 
  # Scenario: Add a fic
  #   And I follow "Add fic"
  #   And I fill in 250 words of lorem ipsum for "Content"
  #   And I press "Add fic" 
  #   Then I should see "Your fic was too long for this story."
    
  Scenario: Try to add a fic when logged out
    And I follow "Log out"
    And I go to the story page
    Then I should not see "Add fic"