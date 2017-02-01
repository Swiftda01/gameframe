When(/^they click on an item's "([^"]*)" button$/) do |element|
  within("#game#{Game.last.id}") { click_on element }
end

Then(/^that item should be added to their cart$/) do
  expect(Game.last.cart_games.count).to eq(1)
end

Then(/^they see the items listed on the same line with the correct quantity$/) do
  page.should have_content("2 × #{CartGame.last.game.title}")
end

Given(/^they have previously added a game to their cart$/) do
  steps %{
    Given they have navigated to "store/index"
    When they click on an item's "Add to Cart" button
  }
end

Then(/^their cart will be emptied$/) do
  expect(Cart.count).to eq(0)
end