Rails.application.routes.draw do
  root 'application#index'

  get 'register', to: 'users#new'

  resources :articles
  
  resources :users, except: [:new]
end
