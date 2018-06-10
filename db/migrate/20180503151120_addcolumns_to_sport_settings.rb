class AddcolumnsToSportSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :user_sport_settings,  :userID, :integer
    add_column :user_sport_settings,  :sportID, :integer
    add_index :user_sport_settings, [:userID, :sportID], unique: true, using: :btree
    add_index :user_sport_settings, :userID, using: :btree
    add_index :user_sport_settings, :sportID, using: :btree
  end
end
