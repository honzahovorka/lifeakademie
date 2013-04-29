LifeakademieCz::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  resources :users

  match '/registrace' => 'users#new', via: :get, as: 'register'
  match '/registrace/:user_id/dokoncit/:hash' => 'users#confirm', via: :get, as: 'confirm_registration'
  match '/registrace/doplneni' => 'users#complete_registration', via: :get, as: 'complete_registration'
  match '/prihlasit' => 'sessions#new', via: :get, as: 'login'
  match '/odhlasit' => 'sessions#destroy', via: :get, as: 'logout'
  match '/prihlasit' => 'sessions#create', via: :post

  match '/nastenka' => 'dashboard#index', via: :get, as: 'dashboard'

  match '/kurzy(/:subpage)' => 'pages#courses', via: :get, as: 'courses'
  match '/terminy(/:location)' => 'courses#index', via: :get, as: 'dates'
  match '/terminy/:id/prihlaseni' => 'courses#reserve', via: :get, as: 'course_reservation'
  match '/terminy/:id/prihlaseni/potvrzeni' => 'courses#finish_reservation', via: :get, as: 'course_reservation_confirmed'
  match '/o-nas' => 'pages#about', via: :get, as: 'about'
  match '/kontakt' => 'pages#contact', via: :get, as: 'contact'

  root to: 'pages#main'
end
