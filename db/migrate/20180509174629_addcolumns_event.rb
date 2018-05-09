class AddcolumnsEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :meeting_events,  :location, :string
    add_column :meeting_events,  :latitude, :float
    add_column :meeting_events,  :longitude, :float
    add_column :meeting_events,  :date, :date
    add_column :meeting_events,  :start_time, :datetime
    add_column :meeting_events,  :end_time, :datetime
    add_column :meeting_events,  :status, :string
    add_column :meeting_events,  :exp_level, :integer
    add_column :meeting_events,  :group_class, :string
    add_column :meeting_events,  :gender, :string
    add_column :meeting_events,  :min_age, :integer
    add_column :meeting_events,  :max_age, :integer
    add_column :meeting_events,  :min_users, :integer
    add_column :meeting_events,  :max_users, :integer
    add_column :meeting_events,  :privacy, :string
    add_column :meeting_events,  :type, :string
    add_column :meeting_events,  :event_type, :string
    add_column :meeting_events,  :country_id, :integer
    add_column :meeting_events,  :state, :string
    add_column :meeting_events,  :city, :string
    add_column :meeting_events,  :zip_code, :string
    add_column :meeting_events,  :periodic, :string
    add_column :meeting_events,  :periodic_interval, :string
    add_column :meeting_events,  :periodic_run, :string

  end
end
