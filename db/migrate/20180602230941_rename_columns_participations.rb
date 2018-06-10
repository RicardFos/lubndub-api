class RenameColumnsParticipations < ActiveRecord::Migration[5.1]
  def change
    rename_column :participations, :userID, :user_id
    rename_column :participations, :meeting_eventID, :meeting_event_id
  end
end
