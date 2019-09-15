class CreatePostReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :post_replies do |t|
      t.references :post_id, foreign_key: true
      t.text :content
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
