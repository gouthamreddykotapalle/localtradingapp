And(/^I enter an incorrect password "([^"]*)"$/) do |arg|
  fill_in 'Password', with: arg
end

And(/^I enter my correct password "([^"]*)"$/) do |arg|
  fill_in 'Password', with: arg
end

Then(/^I should see the "([^"]*)" notice$/) do |arg|
  expect(page.find('#notice')).to have_text arg
end
