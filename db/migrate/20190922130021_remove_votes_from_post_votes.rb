class RemoveVotesFromPostVotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_votes, :votes, :integer
  end
end
