class Sport < ApplicationRecord
  has_many :user_sport_settings
  #has_many :users_setting, through: :user_sport_settings, source: :user
  has_secure_token :sport_auth_token
end
