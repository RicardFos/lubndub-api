class AddAuthTokenToSports < ActiveRecord::Migration[5.1]
  def change
    add_column :sports, :sport_auth_token, :string
    add_index :sports, :sport_auth_token, unique: true
  end
end
