class User < ApplicationRecord
  has_many :user_sport_settings
#  has_many :favourite_sports, class_name: "UserSportSetting", foreign_key: "userID"
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :gender, in: ["Male", "Female"]
  has_secure_password
  has_secure_token :user_auth_token


  def as_json(options = {})
    super(options.reverse_merge(except: [:id, :password_digest]))
  end
end
