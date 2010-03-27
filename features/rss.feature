Feature: RSS Feeds
  In order to syndicate my fiction
  As an author
  I want my stories to have RSS feeds.
           
  Background:
    Given a logged in user

Scenario: RSS feed button available  
  Given there are stories in existence   
  And I am on the story page
  Then I should see the RSS feed button	

Scenario: RSS feed is valid        
  Given there are stories in existence      
  And I am on the story page
  Then the RSS feed link should be a valid feed
