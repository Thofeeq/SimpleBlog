Rails.application.routes.draw do
  root 'application#index'

  get 'register', to: 'users#new'

  resources :articles
  
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#create'
end
