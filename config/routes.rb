# frozen_string_literal: true
Rails.application.routes.draw do
  root 'static_page#home'
  get '/about', to: 'static_page#about'
  get '/contact', to: 'static_page#contact'
  get '/privacypolicy', to: 'static_page#privacypolicy'
  get '/terms', to: 'static_page#termsß'

  ###

  # unused but here for reference I guess
  get 'static_page/home'
  get 'static_page/about'
  get 'static_page/contact'
  get 'static_page/privacypolicy'
  get 'static_page/terms'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end