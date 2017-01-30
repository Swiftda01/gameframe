Rails.application.routes.draw do
  
  get 'store/index'

  devise_for :users

  root "store#index"

end
