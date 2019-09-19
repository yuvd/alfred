class ChangeTimeToDatetimeInBookmarks < ActiveRecord::Migration[5.2]
  def change
    change_column :bookmarks, :time, :datetime
  end
end
