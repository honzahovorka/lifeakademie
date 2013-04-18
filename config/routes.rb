LifeakademieCz::Application.routes.draw do
  match '/kurzy(/:subpage)' => 'pages#courses', via: :get, as: 'courses'
  match '/terminy(/:location)' => 'pages#dates', via: :get, as: 'dates'
  match '/o-nas' => 'pages#about', via: :get, as: 'about'
  match '/kontakt' => 'pages#contact', via: :get, as: 'contact'

  root to: 'pages#main'
end
