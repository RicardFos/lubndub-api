class AddColumnsParticipations < ActiveRecord::Migration[5.1]
  def change
    add_column :participations,  :userID, :integer
    add_column :participations,  :meeting_eventID, :integer
    add_index :participations, [:userID, :meeting_eventID], unique: true, using: :btree
    add_index :participations, :userID, using: :btree
    add_index :participations, :meeting_eventID, using: :btree
  end
end
