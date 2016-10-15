Rails.application.routes.draw do

  root 'home#index'

  get '/home' => 'home#index'

  resources :cards

  post '/cards/new' => 'cards#new', as: 'new_card_path'

  post '/cards' => 'cards#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
