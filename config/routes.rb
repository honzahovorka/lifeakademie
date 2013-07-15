LifeakademieCz::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  resources :users

  match '/registrace' => 'users#new', via: :get, as: 'register'
  match '/registrace/:user_id/dokoncit/:hash' => 'users#confirm', via: :get, as: 'confirm_registration'
  match '/registrace/doplneni' => 'users#complete_registration', via: :get, as: 'complete_registration'
  match '/prihlasit' => 'sessions#new', via: :get, as: 'login'
  match '/odhlasit' => 'sessions#destroy', via: :get, as: 'logout'
  match '/prihlasit' => 'sessions#create', via: :post

  match '/profil' => 'users#profile', via: :get, as: 'profile'

  match '/nastenka' => 'dashboard#index', via: :get, as: 'dashboard'

  match '/kurzy(/:subpage)' => 'pages#courses', via: :get, as: 'courses'
  match '/terminy(/mesto/:location)' => 'courses#index', via: :get, as: 'dates'
  match '/terminy/:id' => 'courses#show', via: :get, as: 'course'
  match '/terminy/:id/prihlaseni' => 'courses#reserve', via: :get, as: 'course_reservation'
  match '/terminy/:id/prihlaseni/potvrzeni' => 'courses#finish_reservation', via: :get, as: 'course_reservation_confirmed'
  match '/o-nas' => 'pages#about', via: :get, as: 'about'
  match '/kontakt' => 'pages#contact', via: :get, as: 'contact'
  match '/kontakt' => 'contact_messages#create', via: :post, as: 'send_contact_message'

  scope '/admin' do
    match '/' => 'dashboard#admin', via: :get, as: 'admin_dashboard'
    match '/kurz/vytvorit/novy' => 'courses#new', via: :get, as: 'admin_new_course'
    match '/kurz/:id' => 'courses#view', via: :get, as: 'admin_course'
    match '/kurz/:id' => 'courses#destroy', via: :delete, as: 'admin_course'
    match '/kurz/:id/upravit' => 'courses#edit', via: :get, as: 'admin_edit_course'
    match '/kurzy' => 'courses#list', via: :get, as: 'admin_courses'
  end

  match '/kurzy' => 'courses#create', via: :post
  match '/terminy/:id' => 'courses#update', via: :put

  root to: 'pages#main'
end
