Rails.application.routes.draw do
  
  get 'pay_cards/new'

  root 'home#index'

  get '/home' => 'home#index'

  resources :cards

  post '/cards/new' => 'cards#new', as: 'cards_path'

  post '/pay_cards' => 'pay_cards#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
