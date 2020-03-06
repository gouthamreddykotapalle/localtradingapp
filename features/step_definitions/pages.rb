Given(/^I am on the homepage$/) do
  visit root_path
end

Given(/^I am at the "(.*)" page$/) do |arg|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the "(.*)" page$/) do |arg|
  expect(page.find('#heading1')).to have_text arg
end

Then(/^I should see "(.*)" within "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)"$/) do |arg|
  expect(page.find('#heading1')).to have_text arg
end
