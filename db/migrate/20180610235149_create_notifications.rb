class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :subject
      t.string :action
      t.string :target

      t.timestamps
    end
  end
end
