Rails.application.routes.draw do
  namespace :users do
      resources :search, only: [:create]
    end
  resources :sports, param: :sport_auth_token
  resources :items
  resources :users, param: :user_auth_token do
    member do
      resources :user_sport_settings,  controller: 'user_sport_settings'
      resources :meeting_events, param: :event_auth_token
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post '/login', to: 'authentication#login'
get '/me', to: 'authorized_request#me'
get '/meeting_events', to: 'meeting_events#index_events'
end
