# frozen_string_literal: true
When(/^I click "([^"]*)"$/) do |arg|
  click_link arg
end

When(/^I click the "([^"]*)" link$/) do |arg|
  click_link arg
end

When(/^I click the "([^"]*)" button$/) do |arg|
  click_button arg
end

When(/^I click the button with the id "(.*)"$/) do |arg|
  find("##{arg}").click
end

And(/^I enter my email "([^"]*)"/) do |arg|
  # pending # Write code here that turns the phrase above into concrete actions
  fill_in 'Email', with: arg
end
