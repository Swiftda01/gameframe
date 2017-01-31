Rails.application.routes.draw do
  
  resources :games
  resources :carts
  resources :cart_games
  get 'store/index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "store#index"

end
