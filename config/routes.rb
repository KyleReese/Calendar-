Rails.application.routes.draw do
  get 'reports/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/redirect', to: 'events#redirect', as: 'redirect'
  get '/callback', to: 'events#callback', as: 'callback'
  get '/calendars', to: 'events#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'events#google', as: 'google', calendar_id: /[^\/]+/

  resources :users
  root to: "home#index"

  resources :events
  resources :reports
  resources :event_classes
end
