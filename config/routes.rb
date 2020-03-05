Rails.application.routes.draw do
  get '/', to: 'static_page#home'
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end