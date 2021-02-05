Rails.application.routes.draw do
  
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'
  
  get '/users/:id/likes', to: 'users#likes'
  get '/users/:id/actionplan', to: 'users#actionplan'
  
  resources :users do
    resources :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  root 'static_pages#home'
end
