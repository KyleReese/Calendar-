Rails.application.routes.draw do
  get 'google_event/index'
  resources :testing

  get 'reports/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users do
    resources :events
    resources :reports
    resources :event_classes
    resources :metric_classes, only: [:show]
    resources :google_event
  end
end
