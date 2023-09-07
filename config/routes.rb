Rails.application.routes.draw do
  get 'homes/index'
  get 'homes/termin'
  resources :upkeeps
  resources :engines
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
