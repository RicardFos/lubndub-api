class UserSportSetting < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  validates_inclusion_of :exp_level, in: [1,2,3,4]
  validates_inclusion_of :group_class, in: ["Yes", "No"]
  validates_inclusion_of :last_minutes, in: ["Yes", "No"]
end
