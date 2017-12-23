Rails.application.routes.draw do

  root to: "books#index"

  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'

  get '/sign_in' => 'sessions#new'
  post '/sign_in' => 'sessions#create'
  get 'sign_out' => 'sessions#destroy'

  resources :books
  resources :reviews
  resources :titles
  resources :order_items
  resource :cart, only: [:show]

  get 'finalize' => 'carts#finalize'

end
