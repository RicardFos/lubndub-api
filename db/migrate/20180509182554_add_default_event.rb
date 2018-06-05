class AddDefaultEvent < ActiveRecord::Migration[5.1]
  def change
    change_column :meeting_events, :group_class, :string, default: "No"
    change_column :meeting_events, :country_id, :integer, default: 0
    change_column :meeting_events, :periodic, :string, default: "No"
    change_column :meeting_events, :periodic_interval, :string, default: "WEEK"
    change_column :meeting_events, :periodic_run, :string, default: "No"
  end
end
