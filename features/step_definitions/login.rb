And(/^I enter an incorrect password "([^"]*)"$/) do |arg|
  fill_in 'Password', with: arg
end

And(/^I enter my correct password "([^"]*)"$/) do |arg|
  fill_in 'Password', with: arg
end

Then(/^I should see the "([^"]*)" notice$/) do |arg|
  expect(page.find('#notice')).to have_text arg
end

Given(/^I have logged in with account "([^"]*)" and password "([^"]*)"$/) do |arg1, arg2|
  steps %{
    Given I am on the homepage
    And An account exists with first name "John", last name "Doe", email "#{arg1}", and password "#{arg2}"
    When I click the "Login" link
    Then I should see the "Login" page
    When I enter my email "#{arg1}"
    And I enter my correct password "#{arg2}"
    And I click the "Login" button
  }
end
