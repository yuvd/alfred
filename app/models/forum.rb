class Forum < ApplicationRecord
  belongs_to :place
  has_many :posts
  has_many :forum_users
  has_many :users, through: :forum_users
end
