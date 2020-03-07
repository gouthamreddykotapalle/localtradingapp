Feature: Posts regarding selling items
  Users should be able to post the information on the items they want to sell.
  Posts should be visualized and listed, so that other users can read the posts and contact sellers.

  Scenario: Read the Sell Posts nearby
    Given I am on the homepage
    When I click the "sell" button
    Then I should see the "Selling Items" page

  Scenario: post an item to sell
    Given I am on the homepage
    When I click the "sell" button
    Then I should see the "Sell Your Treasure" page
    When I enter "IKEA single bed" into "Title"
    And I enter "bed" into "Category"
    And I enter "120" into "Price"
    And I click the "Post Your Item!" button
    Then I should see the "Selling Items" page

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
