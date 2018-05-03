class CreateUserSportSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_sport_settings do |t|
      t.integer :exp_level
      t.string :group_class
      t.integer :raius
      t.string :last_minutes

      t.timestamps
    end
  end
end
