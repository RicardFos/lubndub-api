class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_event
end
