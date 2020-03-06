Feature: register an account
  As a new user without an account
  So that I can gain access to other features
  I want to register an account to use enhanced features
  

Scenario: register account from the homepage
  Given I am on the homepage
  When I click the "Register" link
  Then I should see the "Register account" page
  When I enter my first name "John"
  And I enter my last name "Doe"
  And I enter my email "john@doe.com"
  And I enter my password "abc123"
  And I click "Register" button
  Then I should see "Hello, John"
