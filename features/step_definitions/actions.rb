# frozen_string_literal: true
When(/^I click "([^"]*)"$/) do |arg|
  click_link arg
end

When(/^I click the "([^"]*)" link$/) do |arg|
  click_link arg
end

When(/^I click the "([^"]*)" link that has ID "([^"]*)"$/) do |linkName, linkID|
  find("#{linkID}").click
end

When(/^I click the "([^"]*)" button$/) do |arg|
  click_button arg
end

When(/^I click the button with the id "(.*)"$/) do |arg|
  find("##{arg}").click
end

When(/^I enter my email "([^"]*)"/) do |arg|
  # pending # Write code here that turns the phrase above into concrete actions
  fill_in 'Email', with: arg
end


When /^I wait for the ajax request to finish$/ do
  start_time = Time.now
  page.evaluate_script('jQuery.isReady&&jQuery.active==0').class.should_not eql(String) until page.evaluate_script('jQuery.isReady&&jQuery.active==0') or (start_time + 5.seconds) < Time.now do
    sleep 1
  end
end

When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

Given /^PENDING/ do
  pending
end