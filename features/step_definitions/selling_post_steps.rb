When(/^I enter "(.*)" into "([^"]*)"$/) do |item, title|
  fill_in(title, with: item)
end

When(/^trigger change event at the field "([^"]*)"$/) do |title|
  page.evaluate_script('jQuery.active')
  field_id = "#" + find_field(title)[:id]
  page.execute_script("$('#{field_id}').trigger('change');")
end

When(/^I click on "get my position"$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I enter ([0-9]+) ([a-zA-Z]+) in the used year$/) do |num, time|
  pending # Write code here that turns the phrase above into concrete actions
end
