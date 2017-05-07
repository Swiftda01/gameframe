Feature: Search

  Background:
    Given sample data is loaded

  @selenium
  Scenario: A user searches for an item by name and any matching items are returned
    Given they have navigated to "/store/index"
      When they complete the "name_search" field with "Final Fantasy XV"
      And they click on "Submit"
    Then they should see "Final Fantasy XV"
