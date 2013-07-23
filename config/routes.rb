LifeakademieCz::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  resources :users

  get '/registrace', to: 'users#new', as: 'register'
  get '/registrace/:user_id/dokoncit/:hash', to: 'users#confirm', as: 'confirm_registration'
  get '/registrace/doplneni', to: 'users#complete_registration', as: 'complete_registration'
  get '/prihlasit', to: 'sessions#new', as: 'login'
  get '/odhlasit', to: 'sessions#destroy', as: 'logout'
  post '/prihlasit', to: 'sessions#create'

  get '/profil', to: 'users#profile', as: 'profile'

  get '/nastenka', to: 'dashboard#index', as: 'dashboard'

  get '/kurzy(/:subpage)', to: 'pages#courses', as: 'courses'
  get '/terminy(/mesto/:location)', to: 'courses#index', as: 'dates'
  get '/terminy/:id', to: 'courses#show', as: 'course'
  get '/terminy/:id/prihlaseni', to: 'courses#reserve', as: 'course_reservation'
  get '/terminy/:id/prihlaseni/potvrzeni', to: 'courses#finish_reservation', as: 'course_reservation_confirmed'
  get '/o-nas', to: 'pages#about', as: 'about'
  get '/kontakt', to: 'pages#contact', as: 'contact'
  post '/kontakt', to: 'contact_messages#create', as: 'send_contact_message'

  scope '/admin' do
    get '/', to: 'dashboard#admin', as: 'admin_dashboard'
    get '/kurz/vytvorit/novy', to: 'courses#new', as: 'admin_new_course'
    get '/kurz/:id', to: 'courses#view', as: 'admin_course'
    delete '/kurz/:id', to: 'courses#destroy', as: 'destroy_admin_course'
    get '/kurz/:id/upravit', to: 'courses#edit', as: 'admin_edit_course'
    get '/kurzy', to: 'courses#list', as: 'admin_courses'
  end

  post '/kurzy' => 'courses#create'
  put '/terminy/:id' => 'courses#update'

  root 'pages#main'
end
