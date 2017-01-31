Feature: Carts

  Background:
    Given sample data is loaded

  Scenario: A user adds an item to their cart
    Given they have navigated to "store/index"
    When they click on an item's "Add to Cart" button
    Then that item should be added to their cart