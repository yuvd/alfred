class AddUserColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :nickname, :string
    add_column :users, :location, :string
  end
end
