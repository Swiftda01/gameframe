Feature: Games

  Background:
    Given sample data is loaded

  @selenium
  Scenario: An user can view a game's details
    Given they have navigated to a game's show page
    Then they should see "Title"
      And they should see "Description"
      And they should see "Release Date"
      And they should see "Players"
      And they should see "Multiplayer Format"
      And they should see "Coop"
      And they should see "Price"

  @selenium
  Scenario: A admin can view a list of all games
    Given they are signed in as an admin
      And they have navigated to "/games"
    Then they should see "Game Listings"
      And they should see a table containing a list of games

  @selenium
  Scenario: An admin can add a game
    Given they are signed in as an admin
      And they have navigated to "/games/new"
    When they complete the "game_title" field with "Test Game"
      And they click on "Create Game"
    Then the game should be created
 
  @selenium
  Scenario: An admin can edit a game's details
    Given they are signed in as an admin
      And they have navigated to a game's edit page
    When they complete the "game_price" field with "30"
      And they click on "Update Game"
    Then the game should be updated

  @selenium
  Scenario: An admin can delete a game
    Given they are signed in as an admin
      And they have navigated to a game's edit page
    When they click on "Delete Game"
    Then the game should be deleted


