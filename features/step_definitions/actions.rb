# frozen_string_literal: true
When(/^I click "([^"]*)"$/) do |arg|
  click_link arg
end

When(/^I click the "([^"]*)" link$/) do |arg|
  click_link arg
end

And(/^I click the "([^"]*)" button$/) do |arg|
  click_button arg
end

And(/^I enter my email "([^"]*)"/) do |arg|
  # pending # Write code here that turns the phrase above into concrete actions
  fill_in 'Email', with: arg
end

And(/^An account exists with first name "([^"]*)", last name "([^"]*)", email "([^"]*)", and password "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  @user = User.create(:first_name => arg1, :last_name => arg2, :email => arg3, :password => arg4)
end
