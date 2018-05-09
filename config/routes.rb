Rails.application.routes.draw do

  resources :meeting_events
  resources :sports, param: :sport_auth_token
  resources :items
  resources :users, param: :user_auth_token do
    member do
      resources :user_sport_settings,  controller: 'user_sport_settings'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post '/login', to: 'authentication#login'
end
