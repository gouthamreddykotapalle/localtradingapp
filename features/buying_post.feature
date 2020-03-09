Feature: Users search nearby items and post their buy requests
  Users can search and see the nearby selling items based on the filters they setup.
  Users should be able to post the information on the items they want to buy.
  Posts should be visualized and listed, so that other users can read the posts and contact buyers.


  Scenario: create a request for a used car
    Given I have logged in with account "a@b.com" and password "123"
    And I am on the homepage
    When I click the button with the id "big-buy-button"
    Then I should see the "Post Your Request" page
    When I enter "Used Car Wanted" into "Title"
    When I enter "vehicle" into "Category"
    And I enter "8000" into "buy_post_price_low"
    And I enter "12000" into "buy_post_price_low"
    And I click the "Post Your Request!" button
    Then I should see the "Item Requests Nearby You" page
    And I should see "Used Car Wanted" in this page"

  Scenario: post an item to sell
    Given I have logged in with account "a@b.com" and password "123"
    And I am on the homepage
    When I click the button with the id "nav-buy"
    Then I should see the "Selling items nearby you" page

