class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :post_id, foreign_key: true
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
