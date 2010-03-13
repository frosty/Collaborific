Feature: Authentication
  In order to write collaborative fiction
  As an author
  I want to create and use an account on the website.
  
  Scenario: Signup
    Given I am on the home page
    Then I should see "Sign Up"

  Scenario: Signup
    Given I am on the home page
    When I follow "Sign Up"
    Then I should be on the signup page

  Scenario: Signup
    Given I am on the signup page
    When I fill in the following:
       | Login             | McTestFace   |
       | Email             | testy@testface.com |
       | Password          | wibble |
       | Confirm Password  | wibble |
    And I press "Sign up"
    Then show me the page