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
      | Title                        | The tale of the flopsy bunny              |
      | Description                  | A story about a cute little bunny rabbit. |
      | Maximum length in words of each story section | 200                                       |
    And I check "Prevent collaborators from going over this limit?"
    And I press "Start story"
    Then I should see "You've started your story! Now it's time to add the first fic."
    And I should see "The tale of the flopsy bunny"
    And I should see "A story about a cute little bunny rabbit."
    
  Scenario: Begin a story
    Given I am on the new story page
    And I fill in the form with valid story data
    And I fill in "Catfood" for "Maximum length in words of each story section"
    And I press "Start story"
    Then I should see "Fic length is not a number"
    
  Scenario: Begin a story
    Given I am on the new story page
    And I fill in the form with valid story data
    And I fill in "-1341" for "Maximum length in words of each story section"
    And I press "Start story"
    Then I should see "Fic length must be greater than 1"
  
  Scenario: View a user's stories
    Given I have started a story with the following data:
      | title              | The tale of the flopsy bunny              |
      | description        | A story about a cute little bunny rabbit. |
      | fic_length         | 200                                       |
      | fic_length_enforce | true                                      |
    When I go to my stories page
    Then I should see "mctestface's stories"
    And I should see "The tale of the flopsy bunny" within "#stories_list"

  Scenario: View all stories
    Given there are stories in existence
    When I go to the stories page
    Then I should see all of the stories
    
  Scenario: No stories
    Given there are no stories in existence
    When I go to the stories page
    Then I should see "No stories added yet..."

  Scenario: View all stories
    # This line adds 'Ode to beans'
    Given there are stories in existence
    When I go to the stories page
    Then I should see "Latest stories"
    And I should see "Ode to beans" within "#story_list"
    And I follow "Ode to beans"
    Then I should be on the story page

  Scenario: View a story
    Given there are stories in existence
    And I am on the story page
    Then I should see all of this story's fics
  
  Scenario: View my story
    Given there are stories in existence
    And I am on my user page
    Then I should see "Ode to beans" within "#story_list"
    
  Scenario: Invite a user
    Given there are stories in existence
    And I am on the story page
    Then I should see "Invite collaborators" within "#sidebar"