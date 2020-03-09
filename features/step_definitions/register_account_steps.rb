And(/^I enter my requested password "([^"]*)"/) do |arg|
  fill_in 'Password', with: arg
end

When(/^I enter my first name "([^"]*)"$/) do |arg|
  fill_in 'First name', with: arg
end

And(/^I enter my last name "([^"]*)"$/) do |arg|
  fill_in 'Last name', with: arg
end


Given(/^An account exists with first name "([^"]*)", last name "([^"]*)", email "([^"]*)", and password "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  User.create(:first_name => arg1, :last_name => arg2, :email => arg3, :password => arg4)
end
