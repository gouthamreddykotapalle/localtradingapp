Rails.application.routes.draw do
  root 'static_page#home'
  get '/about', to: 'static_page#about'
  get '/contact', to: 'static_page#contact'
  get '/privacypolicy', to: 'static_page#privacypolicy'
  get '/terms', to: 'static_page#terms'

  ###

  get 'static_page/home'
  get 'static_page/about'
  get 'static_page/contact'
  get 'static_page/privacypolicy'
  get 'static_page/terms'

  #edited by goutham
  # get '/new' => 'users#new' #renders the new haml for registrations that takes you to create action on POST
  # post '/users' => 'users#create'

  # get '/users/login' => 'users#login' #login view rendered
  # post '/users/login', to: 'sessions#create'


  # post '/sessions' => 'sessions#create'
  #
  # get '/dashboard' => 'users#show'
  # get '/users' => 'users#show'

  # get '/login' => 'users#login'
  # post '/users' => 'sessions#create' # override default POST for users controller
  #
  # get '/logout' => 'sessions#destroy'

  get  'login',  to: 'users#login'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  resources :users
  resources :sell_posts
  resources :buy_posts
end