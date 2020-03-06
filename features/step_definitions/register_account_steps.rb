And(/^I enter my requested password "([^"]*)"/) do |arg|
  fill_in 'Password', with: arg
end

When(/^I enter my first name "([^"]*)"$/) do |arg|
  fill_in 'First name', with: arg
end

And(/^I enter my last name "([^"]*)"$/) do |arg|
  fill_in 'Last name', with: arg
end