Feature: Orders

  Background:
    Given sample data is loaded
      And they have previously registered
      And they have previously signed in

  @selenium
  Scenario: A user places an order
    Given they have previously added a game to their cart
    When they click on "Proceed to Checkout"
      And they complete the "order_first_name" field with "Testopher"
      And they complete the "order_last_name" field with "Testie"
      And they complete the "order_address_line1" field with "1 Test Street"
      And they complete the "order_town_city" field with "Test Town"
      And they complete the "order_county" field with "West Test"
      And they complete the "order_postcode" field with "T3 5TT"
      And they click on "Place Order"
    Then an order should be placed

  @selenium
  Scenario: An user attempts to place an order when their cart is empty
    Given they have navigated to "/orders/new"
    Then they should see "Your cart is empty"
