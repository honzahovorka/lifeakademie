LifeakademieCz::Application.routes.draw do
  resources :users
  # resources :courses

  get '/registrace', to: 'users#new', as: 'register'
  get '/registrace/:user_id/znovu-poslat-potvrzeni', to: 'users#resend_confirmation', as: 'resend_confirmation'
  get '/registrace/:user_id/dokoncit/:hash', to: 'users#confirm', as: 'confirm_registration'
  get '/registrace/doplneni', to: 'users#complete_registration', as: 'complete_registration'
  get '/registrace/reset-hesla', to: 'users#password_reset_request', as: 'request_password_reset'
  post '/registrace/reset-hesla', to: 'users#password_reset', as: 'password_reset'
  get '/registrace/reset-hesla/:id/:hash', to: 'users#change_password', as: 'change_password'

  get '/prihlasit', to: 'sessions#new', as: 'login'
  get '/odhlasit', to: 'sessions#destroy', as: 'logout'
  post '/prihlasit', to: 'sessions#create'

  get '/profil', to: 'users#profile', as: 'profile'
  get '/profil/upravit', to: 'users#edit', as: 'edit_profile'

  get '/nastenka', to: 'dashboard#index', as: 'dashboard'

  get '/kurzy(/:subpage)', to: 'pages#courses', as: 'courses'
  get '/terminy(/mesto/:location)', to: 'courses#index', as: 'dates'
  get '/terminy/:id', to: 'courses#show', as: 'course'
  get '/terminy/:id/prihlaseni', to: 'courses#reserve', as: 'course_reservation'
  get '/terminy/:id/prihlaseni/potvrzeni', to: 'courses#finish_reservation', as: 'course_reservation_confirmed'
  get '/objednavky/:id/storno', to: 'orders#storno', as: 'storno_order'
  get '/objednavky/nezaplacene', to: 'orders#unpaid'
  get '/o-nas', to: 'pages#about', as: 'about'
  get '/partneri', to: 'pages#partners', as: 'partners'
  get '/kontakt', to: 'pages#contact', as: 'contact'
  post '/kontakt', to: 'contact_messages#create', as: 'send_contact_message'

  scope '/admin' do
    get '/', to: 'orders#index', as: 'admin_dashboard'
    get '/kurz/vytvorit/novy', to: 'courses#new', as: 'admin_new_course'
    get '/kurz/:id', to: 'courses#view', as: 'admin_course'
    patch '/kurz/:id', to: 'courses#update'
    delete '/kurz/:id', to: 'courses#destroy', as: 'destroy_admin_course'
    get '/kurz/:id/upravit', to: 'courses#edit', as: 'admin_edit_course'
    get '/kurzy', to: 'courses#list', as: 'admin_courses'
    get '/objednavky', to: 'orders#index', as: 'admin_orders'
    get '/objednavka/:id/zaplatit', to: 'orders#pay_order', as: 'admin_orders_pay'
    get '/objednavka/:id/upravit', to: 'orders#edit', as: 'edit_admin_order'
    get '/objednavky/:id/storno', to: 'orders#admin_storno', as: 'admin_storno_order'
    patch '/objednavka/:id', to: 'orders#update'
    get '/uzivatele', to: 'users#index', as: 'admin_users'
    get '/uzivatel/:id', to: 'users#show', as: 'admin_user'
    delete '/uzivatel/:id', to: 'users#destroy', as: 'destroy_admin_user'
  end

  post '/kurzy' => 'courses#create'
  put '/terminy/:id' => 'courses#update'
  patch '/terminy/:id' => 'courses#update'

  root 'pages#main'
end
