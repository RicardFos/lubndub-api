class AddAuthTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_auth_token, :string
    add_index :users, :user_auth_token, unique: true
  end
end
