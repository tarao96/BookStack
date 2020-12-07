Rails.application.routes.draw do
  
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'
  post '/users/:id/update', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit'
  post '/users/create', to: 'users#create'
  get '/signup', to: 'users#new'
  get '/users/index', to: 'users#index'
  get '/users/:id', to: 'users#show'
  
  get '/posts/index', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts/create', to: 'posts#create'
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/edit', to: 'posts#edit'
  post '/posts/:id/update', to: 'posts#update'
  post '/posts/:id/destroy', to: 'posts#destroy'
 
  
  get root 'static_pages#home'
  get '/about', to: 'static_pages#about'
end
