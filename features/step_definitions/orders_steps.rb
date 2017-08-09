Then(/^an order should be placed$/) do
  expect(Order.count).to eq(1)
end

Then(/^the number of game units sold should increase appropriately$/) do
  game = Game.find_by(title: "Journey")
  expect(game.units_sold).to eq(1)
end