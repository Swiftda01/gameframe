Given(/^they have previously added a game to their cart$/) do
  steps %{
    Given they have navigated to "store/index"
    When they click on an item's "Add to Cart" button
  }
  sleep 5
end

Given(/^they add a different game to their cart$/) do
  visit "store/index"
  within("#game#{Game.first.id}") { click_on "Add to Cart" }
  sleep 5
  expect(Cart.last.cart_games.count).to eq(2)
end

When(/^they click on an item's "([^"]*)" button$/) do |element|
  within("#game#{Game.last.id}") { click_on element }
end

When(/^they click on the delete button$/) do
  within("#item#{Cart.last.cart_games.last.id}") { click_on "x" }
end

Then(/^that item should be added to their cart$/) do
  sleep 3
  expect(Game.last.cart_games.count).to eq(1)
end

Then(/^they see the items listed on the same line with the correct quantity$/) do
  page.should have_content("2 × #{CartGame.last.game.title}")
end

Then(/^their cart will be emptied$/) do
  expect(Cart.count).to eq(0)
end

Then(/^the item will be deleted from their cart$/) do
  expect(Cart.last.cart_games.count).to eq(0)
end

Then(/^one of the items will be deleted from their cart$/) do
  expect(Cart.last.cart_games.count).to eq(1)
end

Then(/^they will be redirected to the store index$/) do
  expect(page).to have_current_path(root_path)
end

Then(/^they will be redirected back to the cart$/) do
  expect(page).to have_current_path(cart_path(Cart.last.id))
end