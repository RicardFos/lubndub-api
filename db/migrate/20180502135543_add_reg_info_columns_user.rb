class AddRegInfoColumnsUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country_ID, :integer
    add_column :users, :state_ID, :integer
  end
end
