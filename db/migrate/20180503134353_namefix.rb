class Namefix < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_sport_settings, :raius, :radius
  end
end
