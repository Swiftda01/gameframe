Given(/^they have navigated to "([^"]*)"$/) do |path|
  visit path
end

When(/^they complete the "([^"]*)" field with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

When(/^they click on "([^"]*)"$/) do |element|
  click_on element
end