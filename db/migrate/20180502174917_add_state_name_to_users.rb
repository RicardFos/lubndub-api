class AddStateNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :state_name, :string
  end
end
