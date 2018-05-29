class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :meeting_events, :start_time, :time
    change_column :meeting_events, :end_time, :time
  end
end
