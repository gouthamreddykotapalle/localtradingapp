Feature: register an account
  As a new user without an account
  So that I can gain access to other features
  I want to register an account
  

Scenario: register account with email
  Given I am anywhere on the website
  When I click "register" button
  Then I should see the registration webpage
  When I enter my email "abc123@xyz123.com" into "email"
  And I enter a password "abcdefg123" into "password"
  And I click "submit"
  Then I should see "An email was sent to abc123@xyz123.com" within "div.account_message"