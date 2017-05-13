module ApplicationHelper
  def total_price(cart_games)
    cart_games.to_a.sum { |cart_game| cart_game.total_price }
  end
end
