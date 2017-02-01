Rails.application.routes.draw do
  
  resources :games
  resources :carts, only: [:show, :destroy]
  resources :cart_games, only: [:show, :create]

  authenticate :user do
    resources :orders, only: [:new, :create]
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'store/index'
  root "store#index"

end
