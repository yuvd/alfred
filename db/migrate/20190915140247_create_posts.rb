class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.references :user_id, foreign_key: true
      t.references :forum_id, foreign_key: true

      t.timestamps
    end
  end
end
