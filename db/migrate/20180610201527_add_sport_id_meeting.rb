class AddSportIdMeeting < ActiveRecord::Migration[5.1]
  def change
    add_column :meeting_events,  :sport_id, :integer
  end
end
