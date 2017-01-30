Then(/^their account should be created$/) do
  expect(User.last.email).to eq('test@test.com')
end

When(/^they complete the "([^"]*)" field with an unpermitted date of birth$/) do |field|
  fill_in field, with: "#{Date.today - (16.years - 1.day)}"
end

Then(/^They fail validation and are made aware of the reason why$/) do
  expect(page.body).to match("Date of birth - You must be at least 16 years old to use this service")
end

Given(/^they have previously registered$/) do
  @user = User.create!(
    { email: "test@test.com", date_of_birth: "20/11/1970", password: "password", password_confirmation: "password" }
  )
end

Then(/^they should be signed in$/) do
  expect(page).to have_content("Signed in successfully.")
end

Given(/^they have previously signed in$/) do
  steps %{
    Given they have navigated to "/users/sign_in"
    When they complete the "user_email" field with "test@test.com"
      And they complete the "user_password" field with "password"
      And they click on "Log in"
  }
end

When(/^they are signed in as an admin$/) do
  admin = User.find_by(email: "admin@email.com")
  log_on_as(admin.email)
end

Then(/^they should be signed out$/) do
  expect(page).to have_content("Signed out successfully.")
end

Then(/^their details should be updated$/) do
  expect(User.last.email).to eq('new_email_address@test.com')
end