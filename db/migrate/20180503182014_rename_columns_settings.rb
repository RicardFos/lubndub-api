class RenameColumnsSettings < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_sport_settings, :userID, :user_id
    rename_column :user_sport_settings, :sportID, :sport_id
  end
end
