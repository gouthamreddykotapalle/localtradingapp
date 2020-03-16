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
  And I enter my requested password "abc123"
  And I click the "Register" button
  Then I should see "Hello, John"

Scenario: register account from the login page
  Given I am at the login page
  When I click the "Register" link that has ID "#register-button-at-login"
  Then I should see the "Register account" page
  When I enter my first name "John"
  And I enter my last name "Doe"
  And I enter my email "john@doe.com"
  And I enter my requested password "abc123"
  And I click the "Register" button
  Then I should see "Hello, John"
