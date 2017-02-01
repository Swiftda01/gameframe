Feature: Games

  Background:
    Given sample data is loaded
  
  @selenium
  Scenario: A user views a game's details
    Given they have navigated to a game's show page
    Then they should see "Title"
      And they should see "Description"
      And they should see "Release Date"
      And they should see "Players"
      And they should see "Multiplayer Format"
      And they should see "Coop"
      And they should see "Price"
  
  @selenium
  Scenario: An admin views a list of all games
    Given they are signed in as an admin
      And they have navigated to "/games"
    Then they should see "Game Listings"
      And they should see a table containing a list of games
  
  @selenium
  Scenario: An admin adds a game
    Given they are signed in as an admin
      And they have navigated to "/games/new"
    When they complete the "game_title" field with "Test Game"
      And they complete the "game_price" field with "40"
      And they click on "Create Game"
    Then the game should be created
  
  @selenium
  Scenario: An admin gets an error message when a game is not successfully added
    Given they are signed in as an admin
      And they have navigated to "/games/new"
    When they complete the "game_title" field with "Test Game"
      And they complete the "game_price" field with "0"
      And they click on "Create Game"
    Then they should see "Price must be greater than or equal to 0.01"
  
  @selenium
  Scenario: An admin edits a game's details
    Given they are signed in as an admin
      And they have navigated to a game's edit page
    When they complete the "game_price" field with "30"
      And they click on "Update Game"
    Then the game should be updated
  
  @selenium
  Scenario: An admin gets an error message when a game is not successfully updated
    Given they are signed in as an admin
      And they have navigated to a game's edit page
    When they complete the "game_price" field with "0"
      And they click on "Update Game"
    Then they should see "Price must be greater than or equal to 0.01"
  
  @selenium
  Scenario: An admin deletes a game
    Given they are signed in as an admin
      And they have navigated to a game's edit page
    When they click on "Delete Game"
    Then the game should be deleted


