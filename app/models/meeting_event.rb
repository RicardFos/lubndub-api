class MeetingEvent < ApplicationRecord
  belongs_to :user
  validates_inclusion_of :status, in: ["Active", "Inactive", "Cancelled"]
  validates_inclusion_of :exp_level, in: [1,2,3,4]
  validates_inclusion_of :group_class, in: ["Yes", "No"]
  validates_inclusion_of :gender, in: ["Male", "Female", "Both"]
  validates_inclusion_of :privacy, in: ["Public", "Private"]
  validates_inclusion_of :type, in: ["Meeting", "Event"]
  validates_inclusion_of :periodic, in: ["Yes", "No"]
  validates_inclusion_of :periodic_interval, in: ["WEEK", "MONTH"]
end
