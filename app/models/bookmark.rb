class Bookmark < ApplicationRecord
  belongs_to :user_id
  belongs_to :place_id
end
