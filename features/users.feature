Feature: Users
  
  @selenium
  Scenario: A user registers for an account
    Given they have navigated to "/users/sign_up"
    When they complete the "user_email" field with "test@test.com"
      And they complete the "user_password" field with "password"
      And they complete the "user_password_confirmation" field with "password"
      And they click on "Sign up"
    Then a user should be created

  @selenium
  Scenario: A user signs in
    Given they have navigated to "/users/sign_in"
      And they have previously registered
    When they complete the "user_email" field with "test@test.com"
      And they complete the "user_password" field with "password"
      And they click on "Log in"
    Then a user should be signed in

  @selenium
  Scenario: A user signs out
    Given they have previously registered
      And they have previously signed in
    When they click on "Sign out"
    Then they should be signed out