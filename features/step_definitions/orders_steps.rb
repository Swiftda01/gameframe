Then(/^an order should be placed$/) do
  expect(Order.count).to eq(1)
end