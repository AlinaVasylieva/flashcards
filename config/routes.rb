Rails.application.routes.draw do
  root 'home#index'
  get 'logout' => 'sessions#destroy', :as =>'logout'
  get 'login' => 'sessions#new', :as =>'login'
  get 'signup' => 'users#new', :as => 'signup'
 
  post '/check' => 'home#check'

  resources :cards
  resources :users
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
