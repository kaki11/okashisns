Rails.application.routes.draw do
  root 'home#index'
  get  '/signup',  to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users do
    # /users/:id/following のルーティングを作る
    member do
     get :following, :followers
    end
  end
  
  resources :microposts do
    member do
      get :category
    end
  end

  resources :favorites, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  get    '/search',   to: 'microposts#search'
  get  '/about',  to: 'home#about'
end
