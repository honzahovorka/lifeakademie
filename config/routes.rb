LifeakademieCz::Application.routes.draw do
  match '/registrace' => 'users#new', via: :get
  resources :users

  match '/prihlasit' => 'sessions#new', via: :get
  match '/odhlasit' => 'sessions#destroy', via: :get, as: 'logout'

  match '/prihlasit' => 'sessions#create', via: :post, as: 'login'

  match '/kurzy(/:subpage)' => 'pages#courses', via: :get, as: 'courses'
  match '/terminy(/:location)' => 'pages#dates', via: :get, as: 'dates'
  match '/o-nas' => 'pages#about', via: :get, as: 'about'
  match '/kontakt' => 'pages#contact', via: :get, as: 'contact'

  root to: 'pages#main'
end
