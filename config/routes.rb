Rails.application.routes.draw do
  get 'sessions/new'
  root 'home#index'
  get  '/signup',  to: 'users#new'
  resources :users
end
