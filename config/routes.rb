Rails.application.routes.draw do
  get 'reports/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  root to: "home#index"
  resources :events
  resources :reports
  resources :event_classes
end
