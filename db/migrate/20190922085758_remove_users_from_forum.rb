class RemoveUsersFromForum < ActiveRecord::Migration[5.2]
  def change
    remove_reference :forums, :users, foreign_key: true
  end
end
