Feature: Account dashboard


#  Scenario: Read the Sell Posts nearby
#    Given I have logged in with account "a@b.com" and password "123"
#    And I am on the homepage
#    When I click the button with the id "nav-sell"
#    Then I should see the "Item Requests Nearby You" page

  Scenario: See my sell post on the account dashboard after creating a sell post
    Given I have logged in with account "a@b.com" and password "123"
    And I am on the homepage
    When I click the button with the id "big-sell-button"
    Then I should see the "Sell Your Treasure" page
    When I enter "IKEA single bed" into "Title"
    And I enter "bed" into "Category"
    And I enter "120" into "Price"
    And I click the "Post Your Item!" button
    Then I should see the "Selling items nearby you" page
    When I click the "My Account" link
    Then I should see "IKEA single bed" in this page"

  Scenario: See my buy post on the account dashboard after creating a buy post
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
    When I click the "My Account" link
    Then I should see "Used Car Wanted" in this page"
  

#  Scenario: provide details on the bed I am selling
#    Given I am at the "sell an item - details" page
#    When I enter "single" into "size"
#    And I enter "IKEA" into "brand"
#    And I enter 1 year in the used year
#    And I click the "next" button
#    Then I should see the "nearby potential buyers" page
#    And I should see "50" within "div.estimated_price"
#    When I enter "60" into "Selling Price"
#    And I click the "post my item" button
#    And I should see the "map" page
