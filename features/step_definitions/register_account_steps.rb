When(/^I enter my first name "([^"]*)"$/) do |arg|
  fill_in 'First name', with: arg
end

And(/^I enter my last name "([^"]*)"$/) do |arg|
  fill_in 'Last name', with: arg
end

And(/^I enter my email "([^"]*)"/) do |arg|
  # pending # Write code here that turns the phrase above into concrete actions
  fill_in 'Email', with: arg
end

And(/^I enter my password "([^"]*)"/) do |arg|
  fill_in 'Password', with: arg
end

Then(/^I should see "([^"]*)"$/) do |arg|
  expect(page.find('#heading1')).to have_text arg
end