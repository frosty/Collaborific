Feature: Writing stories
  As an author
  I want to write collaborative fiction
  So I can improve my writing skills and make friends
  
  Background:
    Given a logged in user
  
  Scenario: Begin a story
    When I go to the home page
    And I follow "Start a new story"
    Then I should be on the new story page
  
  # This scenario should probably actually check the values stored within the story, to see if they were stored correctly.
  Scenario: Begin a story
    Given I am on the new story page
    And I fill in the following:
      | Title | The tale of the flopsy bunny |
      | Description | A story about a cute little bunny rabbit. |
      | Length of each story section | 200 |
    And I check "Prevent contributors from going over this limit?"
    And I press "Start story"
    Then I should see "You've started your story! Now it's time to add the first fic."
    And I should see "The tale of the flopsy bunny"
    And I should see "A story about a cute little bunny rabbit."