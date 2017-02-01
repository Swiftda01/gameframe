class CombineItemsInCart < ActiveRecord::Migration[5.0]

  def up
    Cart.all.each do |cart|
      sums = cart.cart_games.group(:game_id).sum(:quantity)
      sums.each do |game_id, quantity|
        if quantity > 1
          cart.cart_games.where(game_id: game_id).delete_all
          item = cart.cart_games.build(game_id: game_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    CartGame.where("quantity > 1").each do |item|
      item.quantity.times do 
        CartGame.create(
          cart_id: item.cart_id,
          game_id: item.game_id,
          quantity: 1
        )
      end
      item.destroy
    end
  end
end
