Rails.application.routes.draw do


  resource :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show]

  resources :bands

end
