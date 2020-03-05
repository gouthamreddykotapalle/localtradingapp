Feature: Users search nearby items and post their buy requests
  Users can search and see the nearby selling items based on the filters they setup.
  Users should be able to post the information on the items they want to buy.
  Posts should be visualized and listed, so that other users can read the posts and contact buyers.


  Scenario: search the used cars (Camry 2019) nearby
    Given I am at the "home" page
    When I click "buy" button
    Then I should see the "find your goods" webpage
    When I enter "vehicle" into "category"
    And I enter "8000" into "price (low)"
    And I enter "12000" into "price (high)"
    And I click "Search" button
    Then I should see the "find your goods" webpage
    When I enter "Toyota" into "make"
    And I enter "Camry" into "type"
    And I enter "2018" into "year"
    Then I should see the "find your goods" webpage

  Scenario: post an item to sell
    Given I am at the "find your goods" page
    When I click "post my buy request" button
    Then I should see the "create your buy request" webpage

