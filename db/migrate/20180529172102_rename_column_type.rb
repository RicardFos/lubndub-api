class RenameColumnType < ActiveRecord::Migration[5.1]
  def change
    rename_column :meeting_events, :type, :meeting_event_type
  end
end
