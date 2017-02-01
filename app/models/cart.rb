class Cart < ApplicationRecord
  has_many :cart_games, dependent: :destroy

  def add_item(item)
    current_item = cart_games.find_by(game_id: item.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_games.build(game_id: item.id)
    end
    current_item
  end
end
