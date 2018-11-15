Rails.application.routes.draw do
  root 'application#index'

  get 'signup', to: 'users#new'

  resources :articles
  
  resources :users, except: [:new]
end
