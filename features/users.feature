Feature: Users
  
  @wip
  @selenium
  Scenario: A user registers for an account
    Given they have navigated to "/users/sign_up"
    When they complete the "user_email" field with "test@test.com"
      And they complete the "user_date_of_birth" field with "20/11/1970"
      And they complete the "user_password" field with "password"
      And they complete the "user_password_confirmation" field with "password"
      And they click on "Sign up"
    Then their account should be created

  @wip
  @selenium
  Scenario: An underage user attempts to register for an account
    Given they have navigated to "/users/sign_up"
    When they complete the "user_date_of_birth" field with an unpermitted date of birth
      And they click on "Sign up"
    Then They fail validation and are made aware of the reason why

  @wip
  @selenium
  Scenario: A user signs in
    Given they have navigated to "/users/sign_in"
      And they have previously registered
    When they complete the "user_email" field with "test@test.com"
      And they complete the "user_password" field with "password"
      And they click on "Log in"
    Then they should be signed in

  @wip
  @selenium
  Scenario: A user signs out
    Given they have previously registered
      And they have previously signed in
    When they click on "Sign out"
    Then they should be signed out

  @wip
  @selenium
  Scenario: A user edits their details
    Given they have previously registered
      And they have previously signed in
      And they have navigated to "/users/edit"
    When they complete the "user_email" field with "new_email_address@test.com"
      And they complete the "user_current_password" field with "password"
      And they click on "Update"
    Then their details should be updated

