Feature: Carts

  Background:
    Given sample data is loaded

  @selenium
  Scenario: A user adds an item to their cart
    Given they have navigated to "store/index"
    When they click on an item's "Add to Cart" button
    Then that item should be added to their cart

  @selenium
  Scenario: A user adds multiple of the same items to their cart
    Given they have previously added a game to their cart
      And they click on "Gameframe"
      And they click on an item's "Add to Cart" button
    Then they see the items listed on the same line with the correct quantity

  @selenium
  Scenario: A user empties their cart
    Given they have previously added a game to their cart
    When they click on "Empty cart"
    Then their cart will be emptied

  @selenium
  Scenario: A user deletes the only item in their cart
    Given they have previously added a game to their cart
    When they click on the delete button
    Then their cart will be emptied
      And they will be redirected to the store index

  @selenium
  Scenario: A user deletes an item in their cart whilst other items remain
    Given they have previously added a game to their cart
      And they add a different game to their cart
    When they click on the delete button
    Then one of the items will be deleted from their cart
      And they will be redirected back to the cart
