Rails.application.routes.draw do
  
  get 'store/index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "store#index"

end
