LifeakademieCz::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  match '/registrace' => 'users#new', via: :get, as: 'register'
  resources :users
  match '/registrace/:user_id/dokoncit/:hash' => 'users#confirm', via: :get, as: 'confirm_registration'

  match '/prihlasit' => 'sessions#new', via: :get
  match '/odhlasit' => 'sessions#destroy', via: :get, as: 'logout'

  match '/prihlasit' => 'sessions#create', via: :post, as: 'login'

  match '/nastenka' => 'dashboard#index', via: :get, as: 'dashboard'

  match '/kurzy(/:subpage)' => 'pages#courses', via: :get, as: 'courses'
  match '/terminy(/:location)' => 'courses#index', via: :get, as: 'dates'
  match '/o-nas' => 'pages#about', via: :get, as: 'about'
  match '/kontakt' => 'pages#contact', via: :get, as: 'contact'

  root to: 'pages#main'
end
