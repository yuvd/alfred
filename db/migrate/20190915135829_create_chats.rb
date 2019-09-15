class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :user_id, foreign_key: true
      t.references :second_user_id, foreign_key: true

      t.timestamps
    end
  end
end
