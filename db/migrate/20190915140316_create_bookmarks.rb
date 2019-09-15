class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user_id, foreign_key: true
      t.references :place_id, foreign_key: true
      t.date :time

      t.timestamps
    end
  end
end
