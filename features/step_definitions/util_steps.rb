Given(/^sample data is loaded$/) do
  require './db/seeds'
  extend SeedData
end

Given(/^they have navigated to "([^"]*)"$/) do |path|
  visit path
end

When(/^they complete the "([^"]*)" field with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

When(/^they click on "([^"]*)"$/) do |element|
  click_on element
end

Then(/^they should see "([^"]*)"$/) do |content|
  page.should have_content(content)
end

Then(/^validation is failed and they are advised "([^"]*)"$/) do |notice|
  expect(page.body).to match(notice)
end