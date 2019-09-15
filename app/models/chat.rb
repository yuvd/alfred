class Chat < ApplicationRecord
  belongs_to :user_id
  belongs_to :second_user_id
end
