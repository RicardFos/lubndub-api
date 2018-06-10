class AddSportauthtokenToMeetingEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :meeting_events, :sport_auth_token, :string
  end
end
