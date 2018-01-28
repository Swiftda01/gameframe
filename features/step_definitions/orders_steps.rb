Then(/^an order should be placed$/) do
  expect(Order.last.postcode).to eq("T3 5TT")
end

Then(/^the number of game units sold should increase appropriately$/) do
  game = Game.find_by(title: "Journey")
  expect(game.units_sold).to eq(1)
end

Then(/^they should see a table containing a list of orders$/) do
  expect(page).to have_selector('tr.game_listing', count: 1)
end
