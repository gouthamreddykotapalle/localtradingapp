Feature: When a category with template is typed, its template will show automatically

  @javascript
  Scenario: type in a category and show template
    Given PENDING
    Given I have logged in with account "a@b.com" and password "123"
    And I am on the homepage
    When I click the button with the id "big-buy-button"
    Then I should see the "Post Your Request" page
    When I enter "car" into "Category"
    And trigger change event at the field "Category"
    And  I wait for 50 seconds
    Then I should see "Make" in this page