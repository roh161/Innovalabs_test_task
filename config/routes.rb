Rails.application.routes.draw do
  #default root route
  root 'home#index'

  #login view routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login_view'

  #signup view routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#sign_up_view'

  #blog index route
  get '/blogs', to: 'blogs#index'

  #logout route
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # API routes 
  post '/api/login', to: 'sessions#login_api'
  post '/api/register', to: 'users#sign_up_api'
  get '/api/blogs', to: 'blogs#blog_list'
  
end
