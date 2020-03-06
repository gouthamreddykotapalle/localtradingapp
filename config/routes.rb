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
  get '/login' => 'users#index' #login view rendered
  get '/new' => 'users#new' #renders the new haml for registrations that takes you to create action on POST
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/dashboard' => 'static_page#index' #change this to post-just go to register for now

  resources :users
  resources :sell_posts
end