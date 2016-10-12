Rails.application.routes.draw do
  get '/home' => 'home#index'

  get '/cards' => 'cards#index'

  get '/cards/:id' => 'cards#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
