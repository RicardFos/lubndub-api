class AddAuthTokenToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :meeting_events, :event_auth_token, :string
    add_index :meeting_events, :event_auth_token, unique: true
  end
end
