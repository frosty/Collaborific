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