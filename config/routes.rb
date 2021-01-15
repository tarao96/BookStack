Rails.application.routes.draw do
  
  get 'comments/create'

  get 'comments/destroy'

  post "likes/:post_id/create", to: "likes#create"
  post "likes/:post_id/destroy", to: "likes#destroy"
  
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'
  post '/users/:id/update', to: 'users#update'
  post '/users/:id/destroy', to: 'users#destroy'
  get '/users/:id/edit', to: 'users#edit'
  post '/users/create', to: 'users#create'
  get '/signup', to: 'users#new'
  get '/users/index', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/likes', to: 'users#likes'
  get '/users/:id/actionplan', to: 'users#actionplan'
  
 resources :posts do
   resources :comments, only: [:create, :destroy]
 end
  
  
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
end
