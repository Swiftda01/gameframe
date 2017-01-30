Given(/^they have navigated to a game's show page$/) do
  visit game_path(Game.find_by(title: "Final Fantasy XV"))
end

Then(/^the game should be created$/) do
  expect(Game.all.count).to eq(4)
end

Given(/^they have navigated to a game's edit page$/) do
  visit edit_game_path(Game.last)
end

Then(/^the game should be updated$/) do
  expect(Game.last.price).to eq(30)
end

Then(/^the game should be deleted$/) do
  expect(Game.all.count).to eq(3)
end