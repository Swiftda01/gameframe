Then(/^a user should be created$/) do
  expect(User.last.email).to eq('test@test.com')
end

Given(/^they have previously registered$/) do
  @user = User.create!(
    { email: "test@test.com", password: "password", password_confirmation: "password" }
  )
end

Then(/^a user should be signed in$/) do
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

Then(/^they should be signed out$/) do
  expect(page).to have_content("Signed out successfully.")
end