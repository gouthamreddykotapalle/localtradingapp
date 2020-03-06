Feature: login to account
  As a user that is not logged in
  So that I can regain access to other features
  I want to login to my account

  Scenario: account does not exist
    Given I am on the homepage
    When I click the "Login" link
    Then I should see the "Login" page
    When I enter my email "john@doe.com"
    And I enter my correct password "abc123"
    And I click the "Login" button
    Then I should see the "email does not exist" notice

  Scenario: successful login
    Given I am on the homepage
    When I click the "Login" link
    Then I should see the "Login" page
    When I enter my email "john@doe.com"
    And I enter my correct password "abc123"
    And I click the "Login" button
    Then I should see "Hello, John"

  Scenario: bad password
    Given I am on the homepage
    When I click the "Login" link
    Then I should see the "Login" page
    And I enter my email "john@doe.com"
    And I enter my incorrect password "xyz321"
    And I click the "Login" button
    Then I should see the "password is incorrect" notice

