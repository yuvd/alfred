class CreatePostReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :post_replies do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
