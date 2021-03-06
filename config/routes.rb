Rails.application.routes.draw do
  namespace :users do
      resources :search, only: [:create]
    end
  resources :sports, param: :sport_auth_token
  resources :users, param: :user_auth_token do
    member do
      resources :user_sport_settings,  controller: 'user_sport_settings'
      resources :participations
      resources :meeting_events, param: :event_auth_token
      resources :notifications
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post '/login', to: 'authentication#login'
get '/me', to: 'authorized_request#me'
get '/meeting_events', to: 'meeting_events#index_events'
get '/notifications', to: 'notifications#index_notifications'
get '/users/:user_auth_token/sports', to: 'user_sport_settings#get_sports'
get '/users/:user_auth_token/events_participating', to: 'participations#index_events_participating'
get '/meeting_events/:event_auth_token/users_participating', to: 'participations#index_users_participating'
get '/meeting_events/:event_auth_token/owner', to: 'meeting_events#get_owner'
delete '/users/:user_auth_token/notifications', to: 'notifications#clear_all_nots_from_user'
end
