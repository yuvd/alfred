class Post < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  has_many :post_votes, dependent: :destroy
  has_many :post_replies, dependent: :destroy
end
