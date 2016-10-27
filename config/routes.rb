Rails.application.routes.draw do
  root 'home#index'

  get '/home' => 'home#index'
  post '/check' => 'home#check'

  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
