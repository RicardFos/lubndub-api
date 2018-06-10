class AddUserIdMeeting < ActiveRecord::Migration[5.1]
  def change
    add_column :meeting_events,  :user_id, :integer
  end
end
