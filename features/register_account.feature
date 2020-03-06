Feature: register an account
  As a new user without an account
  So that I can gain access to other features
  I want to register an account to use enhanced features
  

Scenario: register account from the homepage
  Given I am on the homepage
  When I click "register" button
  Then I should see the "registration" webpage
  When I enter my email "abc123@xyz123.com" into "email"
  And I enter a password "abcdefg123" into "password"
  And I click "submit" button
  Then I should see "An email was sent to abc123@xyz123.com" within "div.account_message"
