class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :time, presence: true
end
