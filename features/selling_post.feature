Feature: Posts regarding selling items
  Users should be able to post the information on the items they want to sell.
  Posts should be visualized and listed, so that other users can read the posts and contact sellers.

  Scenario: post an item to sell
    Given I am at the "home" page
    When I click "sell" button
    Then I should see the "sell an item" webpage
    When I enter "IKEA single bed" into "item"
    And I enter "bed" into "category"
    And I click on "get my position"
    And I click "next" button
    Then I should see "tell me about your treasure"
    And I should see "size" within "form.bed_template"

  Scenario: provide details on the bed I am selling
    Given I am at the "sell an item - details" page
    When I enter "single" into "size"
    And I enter "IKEA" into "brand"
    And I enter 1 year in the used year
    And I click "next" button
    Then I should see the "nearby potential buyers" webpage
    And I should see "50" within "div.estimated_price"
    When I enter "60" into "Selling Price"
    And I click "post my item" button
    And I should see the "map" webpage